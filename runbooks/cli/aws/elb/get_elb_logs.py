#!/usr/bin/env python
# Runbook to get ELB logs and grep them for required status codes.
# This runbook can be run as AWS CLI action while the trigger could be a
# CloudWatch alarm on 5xx count > 0 on ELB or any other trigger. If the
# trigger is from CloudWatch and the alarm contains the ELB as one dimension,
# the ELB name will be available as an env variable but otherwise, you need 
# to replace the ELB name in the runbook.
#
# Also, this runbook takes at least 5 min because of the sleep interval so make
# sure you give an action timeout more than 5 min.

import datetime
import os
import tempfile
import time

AWS_REGION="us-east-1"

# Put your AWS account id here.
AWS_ACCOUNT_ID=615799110750

# Put the s3 location of your ELB logs here. 
ELB_LOGS_S3_LOCATION="bucket/optional_folder"

# Replace the default ELB name with yours if the trigger is not from CloudWatch or 
# if the alert does not contain the load balancer name as a dimension.
ELB_NAME=os.getenv('LoadBalancerName', 'put_elb_name_here')

# grep pattern to search all logs which have ELB status code >= 400
# Change this based on what do you want to grep for in the access logs.
GREP_PATTERN = 'awk \'{if ( $8 >= 400) print $0 }\''

LAST_NMIN=5

# That's it! You don't need to change the remaining runbook unless you have 
# some custom use case.

def main():
    # Get s3 bucket name
    bucket=ELB_LOGS_S3_LOCATION.split('/')[0] if "/" in ELB_LOGS_S3_LOCATION else ELB_LOGS_S3_LOCATION
    folder_prefix=ELB_LOGS_S3_LOCATION.split('/')[1] if "/" in ELB_LOGS_S3_LOCATION else "" 

    # Get the correct s3 log prefix which contains the ELB logs for last N min
    # First, get the next N'th min boundary so that we can look for s3 logs with that timestamp in
    # log file name.
    now=datetime.datetime.utcnow()
    next_nmin_boundary=((int(datetime.datetime.utcnow().strftime("%M")) + LAST_NMIN) / LAST_NMIN) * LAST_NMIN
    min_pattern=next_nmin_boundary % 60
    min_pattern='0'+str(min_pattern) if min_pattern < 10 else str(min_pattern)
    hr_pattern=int(now.strftime('%H')) if next_nmin_boundary < 60 else int(now.strftime('%H')) + 1
    hr_pattern='0'+str(hr_pattern) if hr_pattern < 10 else str(hr_pattern)
    prefix=folder_prefix + '/AWSLogs/' + str(AWS_ACCOUNT_ID) + '/elasticloadbalancing/' + AWS_REGION + \
    '/' + now.strftime('%Y/%m/%d') + '/' + str(AWS_ACCOUNT_ID) + '_elasticloadbalancing_' + AWS_REGION + \
    '_' + ELB_NAME + '_' + now.strftime('%Y%m%d') + 'T' + hr_pattern + min_pattern

    # Sleep for 5 min because ELB logs are uploaded only once in 5 minutes (that's the fasted as of now).
    time.sleep(300)

    # Construct actual command which does the following.
    # 1. List all the S3 logs matching the prefix.
    # 2. Get all those logs and put them on stdout.
    # 3. Grep the logs for the given grep pattern and spit the output to stdout.
    cmd='aws s3api list-objects --bucket ' + bucket + ' --output text --prefix ' + prefix + ' --query \'Contents[].[Key]\' | xargs -I {} aws s3 cp s3://' + bucket + '/{} - | ' + GREP_PATTERN
    print "Executing command: ", cmd

    # Execute the command
    print "Output:"
    os.system(cmd)

if __name__ == "__main__":
    main()
