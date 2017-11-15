#!/bin/bash

# generate RSA cert/key/pfx
openssl req -new -days 365 -nodes -x509 -newkey rsa:2048 -sha256 -subj "/CN=certstore-test" -keyout rsa.key -out rsa.crt
openssl pkcs12 -export -out rsa.pfx -inkey rsa.key -in rsa.crt -passout pass:asdf

# generate EC cert/key/pfx
openssl req -new -days 365 -nodes -x509 -newkey ec:<(openssl ecparam -name prime256v1) -subj "/CN=certstore-test" -keyout ec.key -out ec.crt
openssl pkcs12 -export -out ec.pfx -inkey ec.key -in ec.crt -passout pass:asdf