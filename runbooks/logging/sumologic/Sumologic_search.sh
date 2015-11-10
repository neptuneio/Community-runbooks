# Sumo logic search runbook

# Sumo logic credentials & endpoint here
API_KEY="xyz"
SUMOLOGIC_ENDPOINT=https://ec2-54-165-131-64.compute-1.amazonaws.com:8089

# Search string here
SEARCH_STRING="status>200"

# Run a search and capture search_id 
SEARCH_ID=`curl -sS -k -u $API_KEY ${SUMOLOGIC_ENDPOINT}/services/search/jobs -d search="search ${SEARCH_STRING}" | grep sid | cut -d ">" -f2 | cut -d "<" -f1`

# Wait for a few seconds for search to finish (Increase waiting time as appropriate)
sleep 5

# Fetch the search results now
curl -sS -k -u $API_KEY ${SUMOLOGIC_ENDPOINT}/services/search/jobs/${SEARCH_ID}/results --get -d output_mode=raw
