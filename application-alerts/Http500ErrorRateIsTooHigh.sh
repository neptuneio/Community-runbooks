# ALERT : Http 500 errors too high for my application for last 5 minutes

# Runbook

# step1: check webserver logs
grep -i "ERROR|CRTICAL" /var/apache/*.log

# step2: look for lines where you are throwing 500 errors in the access log
grep " 500 " /var/apache/access.log

# step3: capture top 10 memory hogs on the webserver 
ps aux |sort -nrk 4 |head

# step4: check disk usage
df -lh

# step5: nothing worked, restart nginx server
# /etc/init.d/nginx restart
