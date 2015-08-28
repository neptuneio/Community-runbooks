# ALERT : Error rate > 5% for my application for last 5 minutes

# Runbook

# Step 1: Check webserver logs
grep -i "ERROR|CRTICAL" /var/apache/*.log

# Step 2: Look for lines where you are throwing 500 errors in the access log
grep " 500 " /var/apache/access.log

# Step 3: Capture top 10 cpu hogs on the webserver
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# Step 4: Capture top 10 memory hogs on the webserver
ps aux |sort -nrk 4 |head

# Step 5: Is my db server or third party service is up and running
ping -c 5 database-server.company.com

# Step 6 : Check if disk is full
df -H /dev/critical_disk

# Step 7: Nothing worked, restart nginx server
# /etc/init.d/nginx restart
