#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import sys
import os
import json
import requests
from bs4 import BeautifulSoup

fp = open(sys.argv[1])
contents = fp.read()

soup = BeautifulSoup(contents, 'html.parser')

results = {'attachments':[]}

failflag = False

for status in soup.find_all('status'):
	if status.has_attr('critical'):
	    results['attachments'].append({
		'text': '`{0:40}`  {1}'.format(
            status.parent['name'], 
            ':goodstuff:' if status['status'] == 'PASS' else '🔥'
            ),
		'color': 'good' if status['status'] == 'PASS' else 'danger'
		})

        if status['status'] != 'PASS': failflag = True


results['text'] = '{0}{1}'.format('🔥' if failflag else ':goodstuff:', os.environ['WEB_URL'])
print results['text']

response = requests.post(
    os.environ['SLACK_WEBHOOK'], data=json.dumps(results),
    headers={'Content-Type': 'application/json'}
)

if response.status_code != 200:
    raise ValueError(
        'Request to slack returned an error %s, the response is:\n%s'
        % (response.status_code, response.text)
    )