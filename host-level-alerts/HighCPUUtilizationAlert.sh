# ALERT : CPUUtilization >=99% for 10 min on a server

# Runbook

# step1: capture three snapshots of top output every 10 seconds (sorted by CPU usage)
echo -e "capturing top snapshots (sorted by CPU usage)..."
top -l 3 -s 10

# step2: capture ps aux output for top 10 CPU heavy processes
echo "find top 10 highest cpu consuming processes ..." 
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# step3: check what else is going in the system
echo "checking what else is going on..." 
tail  /var/log/system.log

# step4: is nginx webserver throwing errors because of this spike
echo "is my nginx webserver throwing errors because of this spike?" 
grep "ERROR" /var/nginx/log/nginx.log | tail
