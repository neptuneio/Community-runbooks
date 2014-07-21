# ALERT : Disk Utilization >=99% for 10 min on a server

# Runbook

# step1: get summary of disk space usgae
echo "checking overall disk usage summary..."
df -H 

# step2: check most common culprits
echo "checking most common culprits..."
du -sh /tmp
du -sh /var/apache/log
du -sh /var/log

# Step3: Next filter out filesystem and find out the percentage of space
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'

# Step4: Archive apache logs to Amazon S3
# Assuming logrotate job is alredy setup to archive logs
sudo logrotate -f /etc/logrotate.conf

# Step5: delete old files
# sudo rm /var/apache/log/web_server_old_logs


