# Alert MySQL queries are too slow for last 10 minutes 

# Runbook

# step1: look for slow queries in webserver logs
grep -i "slow queries" /var/nginx/log/*.log 

# step2: is db receiving too many requests per second
/usr/local/analyzedb-load.pl 

# step3: how is the db server cpu doing? (take 3 samples with 10 seconds interval) 
top -l 3 -s 10 

# step4: did db storage disk space exceed threshold?
df -lH 

# step5: is #dbconnections too high (look at the cloudwatch RDS metrics)
# navigate to this url: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#metrics:
