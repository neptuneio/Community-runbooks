# ALERT : CPUUtilization >=80% for 10 min on a server

# Runbook

# Step1: Capture snapshot of top output 
echo "Capturing top snapshots..."
echo "---------------------------"
top -n 1 -b

# Step2: Capture ps aux output for top 10 CPU heavy processes
echo "Find top 10 highest cpu consuming processes ..."
echo "---------------------------"
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# Step3: Is nginx webserver throwing errors because of this spike
echo "Is my nginx webserver throwing errors because of this cpu spike?"
echo "---------------------------"
#grep "ERROR" /var/nginx/log/nginx.log | tail

# Step4: Check what else is going in the system
echo "Checking what else is going on in sys.log"
echo "---------------------------"
# tail  /var/log/sys.log

