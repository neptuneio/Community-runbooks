# Alert: Nginx webserver process crashed

# Runbook

# Step1: Capture any diagnostics for follow up investigation
sudo tail -100 /var/log/nginx/access.log
top -b -n 1

# Step2: Is the proces now running
echo "Checking if nginx is running still"
pgrep -x nginx

# Step 3: Restart nginx server if required, with caution
echo "Restarting nginx";
sudo /etc/init.d/nginx restart
