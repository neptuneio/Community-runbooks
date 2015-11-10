# Alert: #healthy nodes under a AWS Elastic Load Balancer is too low

# Runbook

# Step1: Check the health of instances under the ELB
aws elb describe-instance-health --load-balancer-name <elb-name>

# Step2: Describe the load balancer attributes
aws elb describe-load-balancer-attributes --load-balancer-name <elb-name>

# Step3: Deresiter the bad instance from ELB
aws elb deregister-instances-from-load-balancer --load-balancer-name <elb-name> --instances <comma_seperated_instance_ids>
