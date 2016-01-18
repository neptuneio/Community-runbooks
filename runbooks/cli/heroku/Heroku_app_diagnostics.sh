# Heroku diagnostics Runbook

APP_NAME="heroku_app_name_here"
APP_URL="https://app_name.herokuapp.com/index.html"

# Step 1:
echo "Ping check of app : $APP_URL"
echo "---------------------------"
curl -s -I $APP_URL

# Step 2:
echo "Last 200 lines of heroku logs"
echo "--------------------"
heroku logs -n 200 --app $APP_NAME

# Step 3:
echo "Processes running"
echo "--------------------"
heroku ps --app $APP_NAME

# Step 4:
echo "Recent releases"
echo "-------------------------------"
heroku releases --app $APP_NAME

# Step 5:
#echo "Heroku platform status"
#echo "---------------------"
heroku status

# Step 6:
#echo "Restarting heroku app"
#echo "---------------------"
#heroku ps:restart --app $APP_NAME

# Step 7:
#echo "Rolling back to version v<10>"
#echo "-----------------------------"
#heroku rollback v<10> --app $APP_NAME

# Step 8:
#echo "Scaling up to 2 heroku web dynos and 3 worker dynos"
#echo "-----------------------"
#heroku ps:scale web=2 worker=3 --app $APP_NAME
