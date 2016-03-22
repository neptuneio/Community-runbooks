# Modify the search string per your needs.
SEARCH_STRING="ERROR"

# Modify this to change the duration from which to get logs.
DURATION="15 mins ago"

CURRENT_MILLIS=$(($(date +'%s * 1000 + %-N / 1000000')))
FROM_MILLIS=$(($(date --date="${DURATION}" +'%s * 1000 + %-N / 1000000')))

QUERY="${SUMO_API_ENDPOINT}/logs/search?q=${SEARCH_STRING}&from=${FROM_MILLIS}&to=${CURRENT_MILLIS}"

echo "Querying SumoLogic with query: $QUERY"

# Fetch the search results now
curl -sS -u ${SUMO_ACCESS_ID}:${SUMO_ACCESS_KEY} "$QUERY"

