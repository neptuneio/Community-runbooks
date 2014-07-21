# Alert: #healthy nodes under a AWS Elastic Load Balancer is too low

# Runbook

# step1: check the health of instances under the ELB
aws elb describe-instance-health --load-balancer-name <elb-name>

# step2: describe the load balancer attributes
aws elb describe-load-balancer-attributes --load-balancer-name <elb-name>

# step3: deresiter the bad instance from ELB
aws elb deregister-instances-from-load-balancer --load-balancer-name <elb-name> --instances <comma_seperated_instance_ids>
