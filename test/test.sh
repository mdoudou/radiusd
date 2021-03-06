#!/bin/bash
#set -e
set -u
set -x

cat auth.txt | radclient 127.0.0.1 auto secret -x
cat acct-start.txt | radclient 127.0.0.1 auto secret -x
cat auth.txt | radclient 127.0.0.1 auto secret -x # Error because we already have 1 conn

cat acct-update.txt | radclient 127.0.0.1 auto secret -x
cat acct-stop.txt | radclient 127.0.0.1 auto secret -x
cat auth.txt | radclient 127.0.0.1 auto secret -x # 0 conns remain

cat auth-chap.txt | radclient 127.0.0.1 auto secret -x -i 217 # CHAP-auth (md5)
cat auth-mschapv1.txt | radclient -x 127.0.0.1 auto secret # MS-CHAPv1
cat auth-mschapv2.txt | radclient -x 127.0.0.1 auto secret # MS-CHAPv2
