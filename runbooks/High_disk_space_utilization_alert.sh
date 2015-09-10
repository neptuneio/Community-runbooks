# Alert : Disk utilization >=80% for 5 min on a server

# Runbook :

# Step 1: Check for current disk space utilization
df -h
du -sh /logs/directory

# Step 2: Find few largest files in logs directory which could be causing the fill up
du -ah /logs/directory | sort -nr | head

# To check the disk usage based on time
# du -ah --time /logs/directory

# Step3 : Check for /tmp and /cache files
du -ah /tmp | sort -nr | head
df -h /tmp

du -ah /cache | sort -nr | head
df -h /cache

# Step 4 : Compress all files in /tmp
tar -zcvf /tmp/* > tmp.tar

# Step 5 : Archive files as per a policy
# Command to archive files here
