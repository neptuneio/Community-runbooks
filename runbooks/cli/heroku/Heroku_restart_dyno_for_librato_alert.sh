# Heroku dyno restart runbook based on librato alert

APP_NAME="your-app-name"
# Restart all dynos which are suffering the memory issues.
for dyno in $(echo $NP_METRIC_SOURCES | tr "," " ")
do
  echo "Restarting $dyno"
  heroku ps:restart $dyno --app $APP_NAME
done

heroku logs --app $APP_NAME -n 200

# Add more heroku CLI commands here...
