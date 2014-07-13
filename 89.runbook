####################################
# Runbook for disk space alert on Webserver cluster
# Author : Engineer_Name
# Date updated : 01/02/2014
# Contact :engineer@company.com
####################################

# Step1 : Look at list of processes running with high memory utiliation

top -mem

# Step2 : Check for out of memory errors in log files
grep "Memory exceeded | Out of memory | Memory leak" /path_to/logFile

# Step 3 : Check if there is any code push in last 24 hours
grep "Code deployed" /path_to/depoyment.log

# Step 4 : Capture thread dump for developer to debug
stactrace -process JVM_process_name -output /developer/debug/stacktrace.log

# Step 5 : Restart the process
service JVM_process_name restart
