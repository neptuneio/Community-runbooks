# ALERT : Host raid hardware failed for 3 times in a row in last 5 min

# Runbook

#Step1: Capture dmesg output
echo "Running dmesg to check for h/w errors..."
dmesg

# Step2: Check logs for potential h/w errors
echo "Checking logs for errors..."
tail /var/log/messages
tail /var/log/debug
tail /var/log/kern.log

# Step3: Run any custom h/w checks script
# /usr/local/myapplicaiton/scripts/checkhardwarefailure.pl

# Step4: Reboot server with caution, to see if reboot fixes the problem
# reboot

# Step5: Take host out out of the fleet
# /usr/local/myapplication/scripts/decommissionhost
