# ALERT : MemoryUtilization >=80% for 10 min on a server

# Runbook

# Step1: Find process that are memory hogs
echo "Find processes that are memory hogs..."
echo "--------------------------"
ps aux |sort -nrk 4 |head

# Step2: Capture snapshot of top output 
echo "Capturing top snapshots..."
echo "--------------------------"
top -n1 -b

# Step3: Capture /proc/meminfo
echo "Capturing /proc/meminfo..."
echo "--------------------------"
cat /proc/meminfo

# Step4: Is the host failing health checks?
echo "Run custom health checks on host..."
echo "--------------------------"

# if perl /usr/local/webserver/is_host_failing_health_checks.pl
# then
#     echo "Host health checks PASSED"
# else
#     echo "Host health checks FAILED"
# fi


# Step5: Reboot nginx webserver if required with caution
echo "Restart nginx"
echo "--------------------------"
# /etc/init.d/nginx restart
