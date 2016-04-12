#!/usr/bin/env python

import os
import requests
import time
from urllib import quote

# Replace ERROR with your SumoLogic search query.
SEARCH_STRING='ERROR'

# Change the time here.
TIME_DELTA_MIN=30

# In general, you do not need to modify the below runbook.
TO=int(round(time.time() * 1000))
FROM=TO-TIME_DELTA_MIN*60*1000

parameters = {'q': SEARCH_STRING, 'from': str(FROM), 'to': str(TO)}
encoded = "&".join( "%s=%s" % (key, quote(parameters[key], safe="+"))
    for key in parameters.keys())

response = requests.get(os.environ['SUMO_API_ENDPOINT'] + '/logs/search?' + encoded, auth=(os.environ['SUMO_ACCESS_ID'], os.environ['SUMO_ACCESS_KEY']))
print response.text
