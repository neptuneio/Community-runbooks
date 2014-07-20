# Alert DynamoDBConsumedReadCapacityUnits exceeded 80% of the provisioned throughput

# Runbook

# throughput increase factor
factor=2 

# step1: get current read and write throughtput for the table
read_throughput=`aws dynamodb describe-table --table-name Action | grep ReadCapacityUnits  | cut -d ":" -f 2 | cut -d " " -f 2`
write_throughput=`aws dynamodb describe-table --table-name Action | grep ReadCapacityUnits  | cut -d ":" -f 2 | cut -d " " -f 2`

# step2: determine your new increased read throughput 
read_throughput=$(($read_throghput * $factor))

# step3: update dynamodb table now with new throughput values
aws dynamodb update-table --table-name Action --provisioned-throughput ReadCapacityUnits=$read_throughput,WriteCapacityUnits=$write_throughput
