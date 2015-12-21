# Heroku Auto-scale Runbook

APP_NAME="heroku_app_name_here"

# Step 1: Check number of heroku processes/dynos running
echo "Heroku Processes/dyno count before scaling"
echo "--------------------"
heroku ps --app $APP_NAME

# Step 2 : Scale up workers
echo "Scaling up worker dynos"
echo "---------------------------"
heroku ps:scale worker+1 --app $APP_NAME
# If required scale up to particular web dynos and worker count at once
# heroku scale web=2 worker=3 --app $APP_NAME

# Step 2 : Scale down workers maintaining a minimum of 1 worker dyno
echo "Scaling down worker dynos"
echo "---------------------------"
workers_count=$(heroku ps --app $APP_NAME | grep "worker\." | wc -l)
# Maintain a minimum of 1 worker dyno
if [ "$workers_count" -gt 1 ]
then
  heroku ps:scale worker-1 --app $APP_NAME
  # If required scale up to particular web dynos and worker count at once
  # heroku scale web=1 worker=1 --app $APP_NAME
fi

# Step 3: Wait for 10 seconds to check if scaling operation is successful
echo "Heroku Processes/dyno count after scaling"
echo "--------------------"
sleep 10
heroku ps --app $APP_NAME
