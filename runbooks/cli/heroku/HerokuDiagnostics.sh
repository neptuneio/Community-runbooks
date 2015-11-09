# ALERT : From NewRelic or AWS cloudwatch or any other monitoring tool
# Heroku diagnostics Runbook

# Add your APP_NAME and END_POINT_URL below
APP_NAME="heroku_app_name"
END_POINT_URL="https://xyz.herokuapp.com/index.html"

# Step1 : Check if webapp is up and running for an end user
echo "Ping status of URL : $END_POINT_URL"
echo "---------------------------"
curl -s -I $END_POINT_URL

# Step2: Check heroku logs
echo "Checking Heroku logs"
echo "--------------------"
heroku logs -n 200 --app $APP_NAME

# Step3: Check number of heroku processes/dynos running
echo "Checking Heroku Processes"
echo "--------------------"
heroku ps --app $APP_NAME

# Step4: Check heroku recent releases
echo "Checking Heroku recent releases"
echo "-------------------------------"
heroku releases --app $APP_NAME

# Step5: Restarting heroku app if needed
#echo "Restarting heroku app"
#echo "---------------------"
#heroku restart  --app $APP_NAME

# Step6: Rollback if needed to a specific version
#echo "Rolling back to version v<10>"
#echo "-----------------------------"
#heroku rollback v<10> --app $APP_NAME

# Step7: Scale up no. of heroku dynos if necessary
#echo "Scaling up to 2 heroku dynos"
#echo "-----------------------"
#heroku scale web=2 --app $APP_NAME
