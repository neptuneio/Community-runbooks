username=admin
password=test1234

# enter your search string here
search_string=status>200

# run a search and capture search_id
search_id=`curl -k -u $username:$password https://ec2-54-165-131-64.compute-1.amazonaws.com:8089/services/search/jobs -d search="search ${search_string}" | grep sid | cut -d ">" -f2 | cut -d "<" -f1`

# fetch the results now
curl -k -u $username:$password https://ec2-54-165-131-64.compute-1.amazonaws.com:8089/services/search/jobs/${search_id}/results --get -d output_mode=raw