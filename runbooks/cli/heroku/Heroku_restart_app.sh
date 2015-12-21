# Heroku app restart runbook

APP_NAME="heroku_app_name_here"

# Step 1:
echo "Restarting heroku app"
echo "---------------------"
heroku ps:restart --app $APP_NAME

# Step2:
echo "Last 200 lines of heroku logs"
echo "--------------------"
heroku logs -n 200 --app $APP_NAME

# Add more heroku CLI commands here...
