# Heroku dyno restart runbook

# Get the app and dyno names from trigger data. You might have to 
# change the variables based on your trigger.
APP_NAME=$NP_TRIGGER_APP
DYNO_NAME=$NP_TRIGGER_DYNO

# Restart the dyno only if it's web or worker dyno.
# You can comment this part if it's not required.
if [[ $DYNO_NAME == *"web"* ]] || [[ $DYNO_NAME == *"worker"* ]];
then
  echo "Restarting heroku dyno"
  echo "---------------------"
  heroku ps:restart $DYNO_NAME --app $APP_NAME
fi

# Add more heroku CLI commands here...
