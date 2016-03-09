# Neptune makes available the app and dyno information by parsing your alarm JSON. Use it
APP_NAME=$NP_TRIGGER_HOST
DYNO_NAME=$NP_TRIGGER_DYNO

# Restart web or worker dynos only

if [[ $DYNO_NAME == *"web"* ]] || [[ $DYNO_NAME == *"worker"* ]];
then
    echo "Restarting heroku dyno"
    echo "---------------------"
    heroku ps:restart $DYNO_NAME --app $APP_NAME
else
    echo "Not restarting anything as it's not a web or worker dyno"
fi
