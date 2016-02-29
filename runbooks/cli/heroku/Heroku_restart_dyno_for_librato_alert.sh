# Heroku dyno restart runbook based on librato alert

APP_NAME="your_app_name"

# Restart all dynos that are suffering the memory issues.
for dyno in $(echo $NP_METRIC_SOURCES | tr "," " ")
do
    echo "Restarting $dyno"
    echo "----------------"
    heroku ps:restart $dyno --app $APP_NAME
done

echo "Last 200 lines of $APP_NAME log"
echo "-------------------------------"
heroku logs --app $APP_NAME -n 200
