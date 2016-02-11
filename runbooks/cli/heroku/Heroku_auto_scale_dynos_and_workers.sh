# Heroku Auto-scale Runbook

APP_NAME="your-app-name-here"
DYNO_TYPE="worker"
MAX_NUM_DYNOS=5
MIN_NUM_DYNOS=1

# Step 1:
echo "Heroku Processes/dyno count before scaling"
echo "--------------------"
heroku ps --app $APP_NAME

# Step 2:
dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)
if [ $dyno_count -lt $MAX_NUM_DYNOS ]
then
  echo "Scaling up $DYNO_TYPE dynos upto a maximum of $MAX_NUM_DYNOS"
  echo "---------------------------"
  heroku ps:scale $DYNO_TYPE+1 --app $APP_NAME
  
  # If required scale up to particular web dynos and dyno count at once
  # heroku scale web=2 $DYNO_TYPE=$MAX_NUM_DYNOS --app $APP_NAME
fi

# OR Step 2:
echo "Scaling down $DYNO_TYPE dynos to a minimum of $MIN_NUM_DYNOS"
echo "---------------------------"
dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)
if [ $dyno_count -gt $MIN_NUM_DYNOS ]
then
  heroku ps:scale $DYNO_TYPE-1 --app $APP_NAME
  # If required scale down to particular web dynos and dyno count at once
  # heroku scale web=1 $DYNO_TYPE=$MIN_NUM_DYNOS --app $APP_NAME
fi

# Step 3:
echo "Heroku Processes/dyno count after scaling"
echo "--------------------"
sleep 10
heroku ps --app $APP_NAME
