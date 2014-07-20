# Alert: Nginx webserver process crashed 

# Runbook

# step1: capture any diagnostics for follow up investigation
tail -f /var/nginx/log/nginx.log
top -l 3 -s 10 

# step2: is the proces now running
pgrep nginx
echo "is the process running: $?"

# step 3: restart nginx server 
# /etc/init.d/nginx restart
