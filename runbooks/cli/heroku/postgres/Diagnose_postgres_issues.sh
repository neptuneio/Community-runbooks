# Heroku postgres diagnostics runbook

APP_NAME="your_app_name_here"

# Check all the blocking connections and locks.
heroku pg:blocking -a $APP_NAME
heroku pg:locks -a $APP_NAME

# Run a pg diagnose report.
heroku pg:diagnose -a $APP_NAME

# Check all the long running queries.
heroku pg:long-running-queries -a $APP_NAME

# Kill all pg connections, if you think that is ok.
# heroku pg:killall -a $APP_NAME

