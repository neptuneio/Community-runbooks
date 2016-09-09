#!/bin/bash
echo "INFO: Collecting docker ps data"
sudo docker ps -a
echo

echo "INFO: Collecting docker image list"
sudo docker images
echo

echo "INFO: Docker logs sample (100)"
for container in `docker ps -a | awk '!/NAMES/{print $NF}'`
do 
  echo "INFO: Logs for $container" 
  sudo docker logs $container | tail -100 
  echo 
done

if [ -d "/var/log/docker" ]; then
  echo "INFO: Docker application log sample (100)"
  find /var/log/docker -type f \( -name "*.log" \) -exec tail -n 100  "$file" {} +
fi

