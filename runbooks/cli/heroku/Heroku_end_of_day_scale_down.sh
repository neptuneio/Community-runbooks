# Runbook to scale down heroku dynos at the end of day

APP_NAME="your_app_name_here"

echo "Heroku Processes/dyno count before scaling down at the end of day"
echo "--------------------"
heroku ps --app $APP_NAME

heroku scale web=2 worker=4 --app $APP_NAME

sleep 30

echo "Heroku Processes/dyno count after scaling down"
echo "--------------------"
heroku ps --app $APP_NAME
