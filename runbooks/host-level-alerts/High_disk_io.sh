# ALERT : Disk IO high on a server

# Runbook

# Step1: Get top snapshot
echo "\nChecking process statistics; Look for %wa"
echo "---------------------------"
top -n 1 -b

# Use iostat or iotop if available instead of simple top
# iostat -x 2 5
# iotop -to -d 5

# Step2: Check IO stats of processes of interest
echo "Checking IO stat for process : <process_name>"
echo "---------------------------"
PID=`pgrep -x process_name_here`
cat /proc/$PID/io

# Step 3 : Check which files are being heavily written
echo "Checking for files being heavily written by process of interest"
lsof -p $PID

# Step3: Check for three most common high diskIO culprits : Bad disk, Faulty memory, network problems
echo "Checking system logs for disk errors"
echo "---------------------------"
cat /etc/messages
cat /etc/dmesg
cat /etc/boot.log

# Step4:Check and repair filesystem if needed
echo "Checking and reparing filesystem on disk"
echo "---------------------------"
#fsck /dev/disk1


