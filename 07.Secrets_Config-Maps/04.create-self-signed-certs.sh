#!/bin/bash
openssl genrsa -out 05.https.key 2048
openssl req -new -x509 -key 05.https.key -out 06.https.cert -days 3650 -subj "/CN=www.star-lord.com"
