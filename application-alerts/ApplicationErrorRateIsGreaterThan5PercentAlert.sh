# ALERT : Error rate > 5% for my application for last 5 minutes

# Runbook

# step1: check webserver logs
grep -i "ERROR|CRTICAL" /var/apache/*.log

# step2: look for lines where you are throwing 500 errors in the access log
grep " 500 " /var/apache/access.log

# step3: capture top 10 cpu hogs on the webserver 
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# step4: capture top 10 memory hogs on the webserver 
ps aux |sort -nrk 4 |head

# step5: is my db server up and running
ping -c 5 database-server.company.com 

# step6: nothing worked, restart nginx server
# /etc/init.d/nginx restart




