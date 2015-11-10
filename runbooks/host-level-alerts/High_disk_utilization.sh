# ALERT : Disk Utilization >=80% for 5 min on a server

# Runbook

# Step1: Get summary of disk space usgae
echo "Checking overall disk usage summary..."
echo "----------------------"
df -H

# Step2: Check most common culprits
echo "Checking common disk hogs..."
echo "----------------------"
du -sh /tmp
# du -sh /var/apache/log
# du -sh /var/log

# Step3: Next filter out filesystem and find out the percentage of space
echo "Checking relevant disk usage..."
echo "----------------------"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'

# Step4: Archive relevant files to Amazon S3
# echo "Archive old files"
# echo "----------------------"
# Assuming logrotate job is alredy setup to archive logs
# sudo logrotate -f /etc/logrotate.conf

# Step5: Delete old files with caution
# echo "Cleaning up old files"
# echo "----------------------"
# sudo rm /var/apache/log/web_server_old_logs


