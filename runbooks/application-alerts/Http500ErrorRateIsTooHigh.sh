# ALERT : Http 500 errors too high for my application for last 5 minutes

# Runbook

# Step1: Check webserver logs
grep -i "ERROR|CRITICAL" /var/apache/*.log

# Step2: Look for lines where you are throwing 500 errors in the access log
grep " 500 " /var/apache/access.log

# Step3: Capture top 10 memory hogs on the webserver 
ps aux |sort -nrk 4 |head

# Step4: Check disk usage
df -lh

# Step5: Nothing worked, restart nginx server with caution
# /etc/init.d/nginx restart
