# ALERT : Dyno Load high or Queue size high alert from any monitoring tool
# Heroku Auto-scale Runbook

# Add your APP_NAME here.
APP_NAME="heroku_app_name"

# Step1: Check number of heroku processes/dynos running
echo "Checking Heroku Processes/dyno count"
echo "--------------------"
heroku ps --app $APP_NAME

# Step2 : Scale up workers
echo "Scaling up dynos"
echo "---------------------------"
heroku ps:scale worker+1 --app $APP_NAME
# If required scale up to particular worker count at once
# heroku scale worker=3 --app $APP_NAME

# Step3 : Scale down workers maintaining a minimum of 1 worker dyno
echo "Scaling down dynos"
echo "---------------------------"
workers_count=$(heroku ps -app $APP_NAME | grep "worker\." | wc -l)
# Maintain a minimum of 1 worker dyno
if [ "$workers_count" -gt 1 ]
then
  heroku ps:scale worker-1 --app $APP_NAME
  # If required scale down to particular worker count at once
  # heroku scale worker=1 --app $APP_NAME
fi

# Step4: Wait for 10 seconds to check if scaling up/down is successful
echo "Checking Heroku Processes"
echo "--------------------"
sleep 10
heroku ps --app $APP_NAME
