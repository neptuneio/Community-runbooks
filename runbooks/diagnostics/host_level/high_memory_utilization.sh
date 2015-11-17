# Step1: Find process that are memory hogs
echo "Find processes that are memory hogs..."
echo "--------------------------"
ps aux |sort -nrk 4 |head

# Step2: Capture snapshot of top output
echo "Capturing top snapshots..."
echo "--------------------------"
top -n1 -b

# Step3: Capture /proc/meminfo
echo "Capturing /proc/meminfo..."
echo "--------------------------"
cat /proc/meminfo
