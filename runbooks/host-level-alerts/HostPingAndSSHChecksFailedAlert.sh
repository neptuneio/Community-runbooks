# ALERT : Host not pingable and sshable for 5 min

# Runbook

# step1: reboot ec2 instance failing ping/ssh checks
echo "rebooting ec2 instance..." 
aws ec2 reboot-instnaces --instance-ids <value>

# step2: wait for 3 min, is the host up now? 
echo "waiting for 3 min for host to come up..."
sleep 1800

echo "is the host up after reboot?"
hostname=`aws ec2 describe-instances --instance-ids i-609bfa4c | grep PublicDnsName | cut -d "\"" -f 4`
ping -c 10 $hostname
echo $?
