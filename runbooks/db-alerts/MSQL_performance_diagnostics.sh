# Alert MySQL queries are too slow for last 10 minutes

# Step1: How is the db server cpu doing? (take a snapshot of top output)
top -n 1 -b

# Step2: Did db storage disk space exceed threshold?
df -lH

# Step3: Look for slow queries in webserver logs
grep -i "slow queries" /var/nginx/log/*.log

# Step4: Assuming you have MySQL slow query logging enabled, log the most recent slow queries
tail /var/log/mysql/mylogname.log

# Step5: Is #dbconnections too high? Check the number of connections on the host using netstat)
netstat -ant | awk '{print $6}' | sort | uniq -c | sort -n

# Step6: Assuming you have enabled error logging for MySQL, check the last occurred errors.
tail /var/log/mysql/mysql_error.log

# Step7: Check the MySQL process list at that point of time
mysql --user=$USER --password=$PASSWORD  -e "show processlist;"

# Step8: If you have mysqladmin, you can check the current connection count with this.
# mysqladmin -u $USER -p$PASSWORD extended-status | grep -wi 'threads_connected\|threads_running' | awk '{ print $2,$4}'

# Step9: If you have innotop installed, you can get MySQL top snapshot.
innotop --password $PASSWORD --user $USER --count 5 -n