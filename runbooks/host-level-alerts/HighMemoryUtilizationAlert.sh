# ALERT : MemoryUtilization >=99% for 10 min on a server

# Runbook

# Step1: Find process that are memory hogs
ps aux |sort -nrk 4 |head

# Step2: Capture three snapshots of top output every 10 seconds
echo -e "Capturing top snapshots..."
top -l 3 -s 10

# Step3: Is the host failing health checks?
echo -e "\n\nCheck if host is failing health checks..."
if perl /usr/local/webserver/is_host_failing_health_checks.pl
then
    echo "Host health checks PASSED"
else
    echo "Host health checks FAILED"
fi

# Step4: Capture /proc/meminfo
echo -e "\n\nCapturing /proc/meminfo..."
cat /proc/meminfo

# Step5: Reboot nginx webserver if required with caution
# /etc/init.d/nginx restart
