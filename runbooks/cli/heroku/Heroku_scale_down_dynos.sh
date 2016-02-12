# Change these values and you are taken care.
APP_NAME="your-app-name-here"
DYNO_TYPE="web"
MIN_NUM_DYNOS=1

dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)
if [ $dyno_count -gt $MIN_NUM_DYNOS ]
then
  echo "Heroku Processes/dyno count before scaling"
  echo "--------------------"
  heroku ps --app $APP_NAME

  echo "Scaling down $DYNO_TYPE dynos to a minimum of $MIN_NUM_DYNOS"
  echo "---------------------------"
  heroku ps:scale $DYNO_TYPE-1 --app $APP_NAME
  # If required scale down to particular web dynos and dyno count at once
  # heroku scale web=1 $DYNO_TYPE=$MIN_NUM_DYNOS --app $APP_NAME
fi

sleep 5
echo "Heroku Processes/dyno count after scaling"
echo "--------------------"
heroku ps --app $APP_NAME