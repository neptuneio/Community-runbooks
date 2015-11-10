# ALERT : Host not pingable and sshable for 5 min

# Runbook

# Step1: Reboot ec2 instance failing ping/ssh checks
echo "Rebooting ec2 instance..."
aws ec2 reboot-instnaces --instance-ids <value>

# Step2: Wait for 3 min, is the host up now?
echo "Waiting for 3 min for host to come up..."
sleep 1800

echo "Is the host up after reboot?"
hostname=`aws ec2 describe-instances --instance-ids i-609bfa4c | grep PublicDnsName | cut -d "\"" -f 4`
ping -c 10 $hostname
echo $?
