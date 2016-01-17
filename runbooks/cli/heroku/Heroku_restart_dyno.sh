# Heroku dyno restart runbook

# Get the app and dyno names from trigger data. You might have to 
# change the variables based on your trigger.
APP_NAME=$NP_TRIGGER_APP
DYNO_NAME=$NP_TRIGGER_DYNO

# Step 1:
echo "Restarting heroku dyno"
echo "---------------------"
heroku ps:restart $DYNO_NAME --app $APP_NAME

# Add more heroku CLI commands here...
