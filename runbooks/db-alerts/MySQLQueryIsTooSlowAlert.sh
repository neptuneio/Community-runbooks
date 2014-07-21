# Alert MySQL queries are too slow for last 10 minutes

# Runbook

# Step1: Look for slow queries in webserver logs
grep -i "slow queries" /var/nginx/log/*.log

# Step2: Is db receiving too many requests per second
/usr/local/analyzedb-load.pl

# Step3: How is the db server cpu doing? (take 3 samples with 10 seconds interval)
top -l 3 -s 10

# Step4: Did db storage disk space exceed threshold?
df -lH

# Step5: Is #dbconnections too high (look at the cloudwatch RDS metrics)
# navigate to this url: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#metrics:
