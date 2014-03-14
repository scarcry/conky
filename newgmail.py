#!/usr/bin/env python

import imaplib
import getpass
import sys

if len(sys.argv) != 3:
  print("Usage: %s <gmail address> <password>" % sys.argv[0])
  sys.exit(1)

guser = sys.argv[1]
gpass = sys.argv[2]

mail = imaplib.IMAP4_SSL('imap.gmail.com')

mail.login(guser, gpass)
mail.select('INBOX')
typ, data = mail.search(None, 'UNSEEN')
ids = data[0]
mailcount = ids.split()

print(len(mailcount))

mail.close()
mail.logout()
quit()
