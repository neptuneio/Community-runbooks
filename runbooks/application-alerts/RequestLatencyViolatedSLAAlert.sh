# ALERT : Request Latency violated SLA for last 15 min

# Runbook

# Step1: Are you getting errors now? 
grep -i "ERROR/CRIICAL" /var/nginx/*.log

# Step2: Are you getting timeout errors?
grep -i "Timeout" /var/nginx/*.log

# Step3: What http errors are you getting from webserver now, show a quick sample of non-200 errors
grep -v " 200 " /var/nginx/*.log | head -20

# Step4: Is db server overloaded? 
grep -i "slow queries" /var/mysql/mysqlserver.log

# Step5: Is #connections to DB too high
grep -i "dbconnections too high" /var/mysql/mysqlserver.log




