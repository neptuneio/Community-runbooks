# Potential heroku runbooks

# 1. DB backup
# set environment variable
heroku config:set API_URL='<URL HERE>' --app <APP NAME>

# Database dump
heroku pgbackups:capture
curl -o latest.dump `heroku pgbackups:url`

# Restore locally
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d mydb latest.dump

# Restore - replace DATABASE with url such as HEROKU_POSTGRESQL_WHITE_URL
heroku pgbackups:restore DATABASE 'https://s3.amazonaws.com/me/items/3H0q/mydb.dump'


# 2. Reset db on heroku
heroku pg:psql --app app-booster-demo < ~/Dropbox/app_booster_prod.sql 

heroku pg:reset HEROKU_POSTGRESQL_CYAN_URL --confirm app-booster-demo

heroku ps:scale web=1 worker=1

# 3.Migrate db changes in staging/prod with cron
heroku run rake db:migrate
