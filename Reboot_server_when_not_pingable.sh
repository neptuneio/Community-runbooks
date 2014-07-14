# Alert : Status health check fails on a server (EC2 machine)

# Runbook : 

# Step 1 : Call AWS API to restart/reboot the machine

aws ec2 restart <instance_id>
