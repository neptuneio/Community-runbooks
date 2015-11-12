# Splunk search runbook

# Search string here
SEARCH_STRING="status>200"

# Run a search and capture search_id 
SEARCH_ID=`curl -sS -k -u $SPLUNK_USERNAME:$SPLUNK_PASSWORD ${SPLUNK_ENDPOINT}/services/search/jobs -d search="search ${SEARCH_STRING}" | grep sid | cut -d ">" -f2 | cut -d "<" -f1`

# Wait for a few seconds for search to finish (Increase waiting time as appropriate)
sleep 5

# Fetch the search results now
curl -sS -k -u $SPLUNK_USERNAME:$SPLUNK_PASSWORD ${SPLUNK_ENDPOINT}/services/search/jobs/${SEARCH_ID}/results --get -d output_mode=raw
