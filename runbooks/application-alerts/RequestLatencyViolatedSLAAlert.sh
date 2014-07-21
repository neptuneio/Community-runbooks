# ALERT : Request Latency violated SLA for last 15 min

# Runbook

# step1: are you getting errors now? 
grep -i "ERROR/CRIICAL" /var/nginx/*.log

# step2: are you getting timeout errors?
grep -i "Timeout" /var/nginx/*.log

# step3: what http errors are you getting from webserver now, show a quick sample of non-200 errors
grep -v " 200 " /var/nginx/*.log | head -20

# step4: is db server overloaded? 
grep -i "slow queries" /var/mysql/mysqlserver.log

# step5: is #connections to DB too high
grep -i "dbconnections too high" /var/mysql/mysqlserver.log




