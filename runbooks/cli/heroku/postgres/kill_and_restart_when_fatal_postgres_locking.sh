# something seriously wrong with postgres because of blocking connections--kill all and restart

# change your app name
APP_NAME=xxxx

# Get metrics
heroku pg:locks -a $APP_NAME
heroku pg:blocking -a $APP_NAME

# Kill and immediately restart
heroku pg:killall -a $APP_NAME
heroku restart -a $APP_NAME
