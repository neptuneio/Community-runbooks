# ALERT : Disk IO high on a server

# Step 1: Get top snapshot
echo "\nChecking process statistics; Look for %wa"
echo "---------------------------"
top -n 1 -b

# Use iostat or iotop if available instead of simple top
hash iostat 2>/dev/null && iostat -x 2 5
hash iotop 2>/dev/null && iotop -to -d 5

# Step 2: Check IO stats of processes of interest
#echo "Checking IO stat for process : <process_name>"
#echo "---------------------------"
#PID=`pgrep -x process_name_here`
#cat /proc/$PID/io

# Step 3: Check for three most common high diskIO culprits : Bad disk, Faulty memory, network problems
echo "Checking system logs for disk errors"
echo "---------------------------"
[ -f /etc/messages ] && cat /etc/messages
[ -f /etc/dmesg ] && cat /etc/dmesg
[ -f /etc/boot.log ] && cat /etc/boot.log
