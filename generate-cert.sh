#!/bin/sh

openssl req -x509 -newkey rsa:2048 -keyout files/ttrss.key -out files/ttrss.crt -days 365 -nodes
