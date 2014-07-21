# ALERT : Error rate > 5% for my application for last 5 minutes

# Runbook

# Step1: Check webserver logs
grep -i "ERROR|CRTICAL" /var/apache/*.log

# Step2: Look for lines where you are throwing 500 errors in the access log
grep " 500 " /var/apache/access.log

# Step3: Capture top 10 cpu hogs on the webserver 
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# Step4: Capture top 10 memory hogs on the webserver 
ps aux |sort -nrk 4 |head

# Step5: Is my db server up and running
ping -c 5 database-server.company.com 

# Step6: Nothing worked, restart nginx server
# /etc/init.d/nginx restart




