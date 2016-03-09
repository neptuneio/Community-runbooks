# Runbook to scale up or down dynamodb

AWS_REGION="us-east-1"
TABLE_NAME="my_table_name_here"
NEW_READ_CAPACITY_UNITS="20"
NEW_WRITE_CAPACITY_UNITS="30"

# Step 1
echo "Current throughput on table"
echo "-------------------------------"
aws dynamodb describe-table --region $AWS_REGION --table-name $TABLE_NAME 

# Step 2
echo "Updating provisioned capacities on the table"
echo "--------------------------------------------"
aws dynamodb update-table --region $AWS_REGION --table-name $TABLE_NAME --provisioned-throughput ReadCapacityUnits=$NEW_READ_CAPACITY_UNITS,WriteCapacityUnits=$NEW_WRITE_CAPACITY_UNITS
