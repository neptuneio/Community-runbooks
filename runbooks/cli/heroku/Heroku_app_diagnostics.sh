# Heroku diagnostics Runbook

APP_NAME="heroku_app_name_here"
APP_URL="https://app_name.herokuapp.com/index.html"

# Step 1: Check if webapp is up and running for an end user
echo "Ping status of URL : $APP_URL"
echo "---------------------------"
curl -s -I $APP_URL

# Step 2: Check heroku logs
echo "Last 200 lines of heroku logs"
echo "--------------------"
heroku logs -n 200 --app $APP_NAME

# Step 3: Check number of heroku processes/dynos running
echo "Processes running"
echo "--------------------"
heroku ps --app $APP_NAME

# Step 4: Check heroku recent releases
echo "Recent releases"
echo "-------------------------------"
heroku releases --app $APP_NAME

# Step 5: Restart heroku app if needed
#echo "Restarting heroku app"
#echo "---------------------"
#heroku ps:restart --app $APP_NAME

# Step 6: Rollback if needed to a specific version
#echo "Rolling back to version v<10>"
#echo "-----------------------------"
#heroku rollback v<10> --app $APP_NAME

# Step 7: Scale up no. of heroku dynos if necessary
#echo "Scaling up to 2 heroku web dynos and 3 worker dynos"
#echo "-----------------------"
#heroku ps:scale web=2 worker=3 --app $APP_NAME
