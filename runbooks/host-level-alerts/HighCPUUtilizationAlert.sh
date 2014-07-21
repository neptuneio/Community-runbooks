# ALERT : CPUUtilization >=99% for 10 min on a server

# Runbook

# Step1: Capture three snapshots of top output every 10 seconds (sorted by CPU usage)
echo -e "Capturing top snapshots (sorted by CPU usage)..."
top -l 3 -s 10

# Step2: Capture ps aux output for top 10 CPU heavy processes
echo "Find top 10 highest cpu consuming processes ..."
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# Step3: Check what else is going in the system
echo "checking what else is going on..."
tail  /var/log/system.log

# Step4: Is nginx webserver throwing errors because of this spike
echo "Is my nginx webserver throwing errors because of this spike?"
grep "ERROR" /var/nginx/log/nginx.log | tail
