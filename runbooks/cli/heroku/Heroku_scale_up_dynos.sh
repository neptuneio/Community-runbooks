# Heroku dyno scale up runbook
APP_NAME="your_app_name_here"
DYNO_TYPE="web"
MAX_NUM_DYNOS=5

dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)

if [ $dyno_count -lt $MAX_NUM_DYNOS ]
then
  echo "Heroku Processes/dyno count before scaling up"
  echo "--------------------"
  heroku ps --app $APP_NAME

  echo "Scaling up $DYNO_TYPE dynos upto a maximum of $MAX_NUM_DYNOS"
  echo "---------------------------"
  heroku ps:scale $DYNO_TYPE+1 --app $APP_NAME

  # If required scale up to a particular dyno count at once
  # heroku scale web=2 worker=4 --app $APP_NAME
fi

sleep 5
echo "Heroku Processes/dyno count after scaling"
echo "--------------------"
heroku ps --app $APP_NAME
