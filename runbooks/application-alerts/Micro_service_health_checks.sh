# Runbook for micro-service or API health checks

# Define service endpoint here
SERVICE_ENDPOINT1='https://api2.company.com:8090/v1/register'
SERVICE_ENDPOINT2='https://api1.company.com:8090/v1/objects/list'

# Check latency of the services
echo "Latency for endpoint : $SERVICE_ENDPOINT1"
echo "-----------------------------------------"
curl -o /dev/null -s -w "Latency : %{time_total} in seconds\n" $SERVICE_ENDPOINT1

echo "Latency for endpoint : $SERVICE_ENDPOINT2"
echo "-----------------------------------------"
curl -o /dev/null -s -w "Latency : %{time_total} in seconds\n" $SERVICE_ENDPOINT2

# Check the response of the services by posting test data
TEST_DATA1='{"username":"user", "password":"passwd"}'
TEST_DATA2='{"firstname":"steve", "lastname":"jobs"}'

echo "Response for endpoint : $SERVICE_ENDPOINT1"
echo "-----------------------------------------"
curl -X POST -i -H "Content-Type: application/json" -d $TEST_DATA1 $SERVICE_ENDPOINT1 | python -m json.tool

echo "Response for endpoint : $SERVICE_ENDPOINT1"
echo "-----------------------------------------"
curl -X POST -i -H "Content-Type: application/json" -d $TEST_DATA2 $SERVICE_ENDPOINT2 | python -m json.tool

# Add more endpoints and curl commands above to run your health checks
