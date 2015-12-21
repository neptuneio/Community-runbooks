# Heroku Postgres db reset runbook

APP_NAME="heroku_app_name_here"
SQL_COMMANDS="/home/john/app_name_prod.sql"
HEROKU_POSTGRESQL_CYAN_URL="pg_cyan_url_here"

# Step 1:
echo "Reseting db on heroku"
echo "---------------------"
heroku pg:psql --app $APP_NAME < $SQL_COMMANDS
heroku pg:reset $HEROKU_POSTGRESQL_CYAN_URL --confirm $APP_NAME

# Step 2:
echo "Scaling up web and worker dynos"
echo "-------------------------------"
heroku ps:scale web=1 worker=1 --app $APP_NAME

# Step 3:
echo "Migrate db changes"
echo "------------------"
heroku run rake db:migrate --app $APP_NAME
