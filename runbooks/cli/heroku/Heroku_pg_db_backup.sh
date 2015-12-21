# Heroku Postgres db backup runbook

APP_NAME="heroku_app_name_here"
DATABASE_ID="pg_db_id_here"

# Step 1:
echo "Setting heroku environment variables (if required)"
echo "---------------------"
heroku config:set API_URL="api_url_here" --app $APP_NAME

# Step 2:
echo "Getting a database dump"
echo "---------------"
heroku pgbackups:capture --app $APP_NAME
curl -o latest.dump `heroku pgbackups:url`

# Step 3:
echo "Restoring locally"
echo "---------------"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d mydb latest.dump

# Step 4:
echo "Restoring db - replace DATABASE_ID with url such as HEROKU_POSTGRESQL_WHITE_URL"
echo "---------------"
heroku pgbackups:restore $DATABASE_ID 'https://s3.amazonaws.com/bucket_name/mydb.dump'
