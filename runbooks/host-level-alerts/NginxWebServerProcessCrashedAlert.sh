# Alert: Nginx webserver process crashed

# Runbook

# Step1: Capture any diagnostics for follow up investigation
tail -f /var/nginx/log/nginx.log
top -l 3 -s 10

# Step2: Is the proces now running
pgrep nginx
echo "Is the process running: $?"

# Step 3: Restart nginx server if required, with caution
# /etc/init.d/nginx restart
