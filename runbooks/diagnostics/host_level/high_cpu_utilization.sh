# Step1: Capture snapshot of top output
echo "Capturing top snapshots..."
echo "---------------------------"
top -n 1 -b

# Step2: Capture ps aux output for top 10 CPU heavy processes
echo "Find top 10 highest cpu consuming processes ..."
echo "---------------------------"
ps -eo pcpu,pid,user,args | sort -k 1 -r | head
