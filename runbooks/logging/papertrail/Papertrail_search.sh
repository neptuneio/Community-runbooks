# Papertrail search runbook

# Papertrail credentials & endpoint here
API_KEY="xxx"

# Search string here
SEARCH_STRING="200"

# Run the search query
curl -Ss -G -H "X-Papertrail-Token: $API_KEY" "https://papertrailapp.com/api/v1/events/search.json" --data-urlencode "q=200" -d output_mode=raw
