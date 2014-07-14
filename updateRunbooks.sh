#! /bin/sh 

for line in `cat mapping`
do
  script=`echo $line | cut -d":" -f1`
  runbookId=`echo $line | cut -d":" -f2`
  runbookName=$runbookId".runbook"
  cp $script neptuneio-action-templates/$runbookName
done

# Sync runbooks directory to S3
s3cmd sync --exclude '.DS_Store' --add-header=Expires:max-age=604800 --acl-public neptuneio-action-templates s3://neptuneio-downloads/

