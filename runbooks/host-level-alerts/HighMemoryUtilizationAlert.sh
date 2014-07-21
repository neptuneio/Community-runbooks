# ALERT : MemoryUtilization >=99% for 10 min on a server

# Runbook

# step1: find process that are memory hogs
ps aux |sort -nrk 4 |head

# step2: capture three snapshots of top output every 10 seconds
echo -e "capturing top snapshots..."
top -l 3 -s 10

# step3: is the host failing health checks? 
echo -e "\n\ncheck if host is failing health checks..."
if perl /usr/local/webserver/is_host_failing_health_checks.pl
then
    echo "host health checks PASSED"
else
    echo "host health checks FAILED"
fi

# step4: capture /proc/meminfo
echo -e "\n\ncapturing /proc/meminfo..."
cat /proc/meminfo

# step5: reboot nginx webserver
# /etc/init.d/nginx restart
