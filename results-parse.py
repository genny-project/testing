#!/usr/bin/env python2
import sys
import json
import requests
from bs4 import BeautifulSoup

fp = open(sys.argv[1])
contents = fp.read()

soup = BeautifulSoup(contents, 'html.parser')

results = {'text': 'Smoke Test Complete!', 'attachments':[]}

for status in soup.find_all('status'):
	if status.has_attr('critical'):
		results['attachments'].append({
			'text': '{0:50} {1}'.format(status.parent['name'], status['status']),
			'color': 'good' if status['status'] == 'PASS' else 'danger'
			})

response = requests.post(
    webhook_url, data=json.dumps(results),
    headers={'Content-Type': 'application/json'}
)

if response.status_code != 200:
    raise ValueError(
        'Request to slack returned an error %s, the response is:\n%s'
        % (response.status_code, response.text)
    )