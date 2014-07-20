# ALERT : Host raid hardware failed for 3 times in a row in last 5 min

# Runbook

#step1: capture dmesg output
echo "running dmesg to check for h/w errors..."
dmesg 

# step2: check logs for potential h/w errors
echo "checking logs for errors..."
tail /var/log/messages
tail /var/log/debug
tail /var/log/kern.log

# step3: run any custom h/w checks script
# /usr/local/myapplicaiton/scripts/checkhardwarefailure.pl

# step4: reboot server if reboot fixes the problem
# reboot 

# step5: take host out out of the fleet
# /usr/local/myapplication/scripts/decommissionhost 
