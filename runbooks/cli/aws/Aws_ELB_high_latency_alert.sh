# Alert: Latency is too high for a given AWS Elastic Load Balancer 

# Runbook

# Step1: Check the health of instances under the ELB
aws elb describe-instance-health --load-balancer-name <elb-name>

# Step2: Describe the load balancer attributes
aws elb describe-load-balancer-attributes --load-balancer-name <elb-name>
