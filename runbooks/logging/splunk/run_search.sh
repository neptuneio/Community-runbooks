# Splunk search runbook

# Splunk credentails & endpoint here
USERNAME=neptune-read-only-user
PASSWORD=neptune
SPLUNK_ENDPOINT=https://ec2-54-165-131-64.compute-1.amazonaws.com:8089

# Search string here
SEARCH_STRING="status>200"

# Run a search and capture search_id 
SEARCH_ID=`curl -sS -k -u $USERNAME:$PASSWORD ${SPLUNK_ENDPOINT}/services/search/jobs -d search="search ${SEARCH_STRING}" | grep sid | cut -d ">" -f2 | cut -d "<" -f1`

# Wait for a few seconds (Increase waiting time as appropriate)
sleep 5

# Fetch the search results now
curl -sS -k -u $USERNAME:$PASSWORD ${SPLUNK_ENDPOINT}/services/search/jobs/${SEARCH_ID}/results --get -d output_mode=raw
