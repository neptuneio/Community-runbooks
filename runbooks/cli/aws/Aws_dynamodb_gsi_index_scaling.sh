# Runbook to scale up or down dynamodb

# make sure you modify below configuration variables
AWS_REGION="us-east-1"
TABLE_NAME="my_table_name_here"
INDEX_NAME="my_table_index_name_here"
NEW_READ_CAPACITY_UNITS="xxx"
NEW_WRITE_CAPACITY_UNITS="xxx"

# Step 1
echo "Current throughput on table and indices"
echo "-------------------------------"
aws dynamodb describe-table --region $AWS_REGION --table-name $TABLE_NAME 

# Step 2
echo "Updating provisioned capacities for the GSI index on the table"
echo "--------------------------------------------"
aws dynamodb update-table --region $AWS_REGION --cli-input-json "{ \"TableName\": \"$TABLE_NAME\", \"GlobalSecondaryIndexUpdates\": [ { \"Update\": { \"IndexName\": \"$INDEX_NAME\", \"ProvisionedThroughput\": { \"ReadCapacityUnits\": $NEW_READ_CAPACITY_UNITS, \"WriteCapacityUnits\": $NEW_WRITE_CAPACITY_UNITS } } } ] }"
