# Alert : CPU utilization <=5 % for 2 hours on an EC2 machine

# Runbook : 

# Step1 : For EC2 machines on Dev and Test clusters only (Not production)
aws ec2 stop_instance <instance_id>
