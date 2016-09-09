#!/bin/bash
PATH=${PATH}:/sbin:/usr/sbin

echo
echo "INFO: Searching for running docker containers"
sudo docker ps
echo

LIMIT=900

DOCKER_STATUS=(`sudo docker ps --format "{{.Status}}"`)
CONT_STATUS=(`echo ${DOCKER_STATUS[0]}`)
CONT_UPTIME=(`echo ${DOCKER_STATUS[1]}`)
CONT_TIMEFRAME=(`echo ${DOCKER_STATUS[2]}`)

case "${CONT_TIMEFRAME}" in
  "a|than")
    CONT_RUN_SEC=-1
    ;;
  "minutes")
    CONT_RUN_SEC=$(expr ${CONT_UPTIME} \* 60)
    ;;
  "hours")
    CONT_RUN_SEC=$(expr ${CONT_UPTIME} \* 60 \* 60)
    ;;
  "days")
    CONT_RUN_SEC=$(expr ${CONT_UPTIME} \* 60 \* 60 \* 24)
    ;;
  "weeks")
    CONT_RUN_SEC=$(expr ${CONT_UPTIME} \* 60 \* 60 \* 24 \* 7)
    ;;
  "months")
    CONT_RUN_SEC=$(expr ${CONT_UPTIME} \* 60 \* 60 \* 24 \* 7 \* 30)
    ;;
  *)
    CONT_RUN_SEC=${CONT_UPTIME}
    ;;
esac

echo "DEBUG: ${CONT_RUN_SEC}"
if [ "${CONT_RUN_SEC}" == "About" ]
then
  CONT_RUN_SEC=-1
fi

if [ "${CONT_RUN_SEC}" -le "${LIMIT}" ]
then
  echo "WARNING: container started less than 15m ago, ignoring"
else
  echo "INFO: Restarting containers"
  sudo docker restart $(sudo docker ps -q)
  echo
  sudo docker ps
fi

