# Alert: Latency is too high for a given AWS Elastic Load Balancer 

# Runbook

# step1: check the health of instances under the ELB
aws elb describe-instance-health --load-balancer-name <elb-name>

# step2: describe the load balancer attributes
aws elb describe-load-balancer-attributes --load-balancer-name <elb-name>
