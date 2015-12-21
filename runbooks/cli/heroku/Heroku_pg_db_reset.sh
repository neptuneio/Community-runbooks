# Heroku Postgres db reset runbook

# Heroku application
APP_NAME="heroku_app_name_here"
SQL_COMMANDS="/home/john/app_name_prod.sql"
HEROKU_POSTGRESQL_CYAN_URL="pg_cyan_url_here"

# Step 1 : Reset db on heroku
heroku pg:psql --app $APP_NAME < $SQL_COMMANDS

heroku pg:reset $HEROKU_POSTGRESQL_CYAN_URL --confirm $APP_NAME

# Step 2 : Scale web and worker dynos appropriately
heroku ps:scale web=1 worker=1 --app $APP_NAME

# Step 3 : Migrate db changes
heroku run rake db:migrate --app $APP_NAME
