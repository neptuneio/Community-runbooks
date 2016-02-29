# Heroku postgres restart runbook

APP_NAME="your_app_name_here"

# Get PG metrics
heroku pg:locks -a $APP_NAME
heroku pg:blocking -a $APP_NAME
heroku pg:diagnose -a $APP_NAME
heroku pg:long-running-queries -a $APP_NAME

# Kill all connections and immediately restart app
heroku pg:killall -a $APP_NAME
heroku restart -a $APP_NAME
