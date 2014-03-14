#!/usr/bin/env python

import feedparser as f
import sys as s

if len(s.argv) != 2:
  print("Usage: %s <rss feed url>" % s.argv[0])
  s.exit(1)

obj = f.parse(s.argv[1])

for n in range(0, 5):
  print(obj['entries'][n]['title'])

s.exit(0)
