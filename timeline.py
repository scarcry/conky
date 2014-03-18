#!/usr/bin/env python

## Requirement:
#+ - python-twitter
#+ - twitter api account for consumer and access keys
#+   https://dev.twitter.com/apps

import twitter
import sys

if len(sys.argv) != 2:
  maxcount = 5
else:
  maxcount = sys.argv[1]

consumer_key = ''
consumer_secret = ''
access_token = ''
access_token_secret = ''

api = twitter.Api(consumer_key, consumer_secret, access_token, access_token_secret)

tweets = api.GetHomeTimeline(count=int(maxcount))
users = [u.user.screen_name for u in tweets]
tweet = [t.text for t in tweets]

for i in range(0, int(maxcount)):
	print("(@%s) - %s" % (users[i], tweet[i]))

sys.exit(0)
