# Heroku dyno scale down runbook
APP_NAME="your_app_name_here"
DYNO_TYPE="web"
MIN_NUM_DYNOS=1

dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)

if [ $dyno_count -gt $MIN_NUM_DYNOS ]
then
  echo "Heroku Processes/dyno count before scaling down"
  echo "--------------------"
  heroku ps --app $APP_NAME

  echo "Scaling down $DYNO_TYPE dynos while maintaining a minimum of $MIN_NUM_DYNOS dynos"
  echo "---------------------------"
  heroku ps:scale $DYNO_TYPE-1 --app $APP_NAME

  # If required scale down to a particular dyno count at once
  # heroku scale web=2 worker=4 --app $APP_NAME
fi

sleep 5

echo "Heroku Processes/dyno count after scaling"
echo "--------------------"
heroku ps --app $APP_NAME
