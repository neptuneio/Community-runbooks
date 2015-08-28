# ALERT : MemoryUtilization >=99% for 10 min on a server

# Runbook

# Step 1: Find process that are memory hogs
ps aux |sort -nrk 4 |head

# Step 2: Capture three snapshots of top output every 10 seconds
echo -e "Capturing top snapshots..."
top -l 3 -s 10

# Step 3: Is the host failing health checks?
echo -e "\n\nCheck if host is failing health checks..."
if perl /usr/local/webserver/is_host_failing_health_checks.pl
then
    echo "Host health checks PASSED"
else
    echo "Host health checks FAILED"
fi

# Step 5 : Capture thread dump for developer to debug
stactrace -process JVM_process_name -output /developer/debug/stacktrace.log

# Step 5: Capture /proc/meminfo
echo -e "\n\nCapturing /proc/meminfo..."
cat /proc/meminfo

# Step 6 : Check for out of memory errors in log files
grep "Memory exceeded | Out of memory | Memory leak" /path_to/logFile

# Step 7 : Check if there is any code push in last 24 hours
grep "Code deployed" /path_to/depoyment.log

# Step 8 : Restart the JVM process
# service JVM_process_name restart

# Step 9: Reboot nginx webserver if required with caution
# /etc/init.d/nginx restart
