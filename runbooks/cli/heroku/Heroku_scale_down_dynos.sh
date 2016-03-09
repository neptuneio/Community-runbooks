# Heroku dyno scale down runbook
APP_NAME="your_app_name_here"
DYNO_TYPE="worker"
MIN_NUM_DYNOS=1

dyno_count=$(heroku ps --app $APP_NAME | grep "$DYNO_TYPE\." | wc -l)

echo "Current dyno count for $DYNO_TYPE type is : $dyno_count"

if [ $dyno_count -gt $MIN_NUM_DYNOS ]
then
    echo "Scaling down $DYNO_TYPE dynos while maintaining a minimum of $MIN_NUM_DYNOS dynos"
    echo "-------------------------------------"
    heroku ps:scale $DYNO_TYPE-1 --app $APP_NAME

    # If required scale up to a particular dyno count at once
    # heroku ps:scale web=2 worker=4 --app $APP_NAME
fi

sleep 5

echo "Dyno count after scaling"
echo "------------------------"
heroku ps --app $APP_NAME
