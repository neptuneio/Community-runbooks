# Alert : Disk utilization >=80% for 5 min on a server

# Runbook :

# Step1 : Check for current disk space utilization
df -H

# Step2 : Find all big files on disk
du -a | sort -nr

# Step3 : Check for /tmp and /cache files
df -H /tmp
df -H /cache

# Step 4 : Compress all files in /tmp
tar -zcvf /tmp/*

# Step 5 : Archive files as per a policy
# Command to archive files here
