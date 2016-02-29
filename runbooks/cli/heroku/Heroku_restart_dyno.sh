# Use the app and dyno information from trigger JSON
# You might have to change the variables based on your trigger.

APP_NAME=$NP_TRIGGER_APP
DYNO_NAME=$NP_TRIGGER_DYNO

# Restart the dyno only if it's web or worker dyno.

if [[ $DYNO_NAME == *"web"* ]] || [[ $DYNO_NAME == *"worker"* ]];
then
    echo "Restarting heroku dyno"
    echo "---------------------"
    heroku ps:restart $DYNO_NAME --app $APP_NAME
else
    echo "Not restarting anything as it's not a web or worker dyno"
fi

# Add more heroku CLI commands here...
