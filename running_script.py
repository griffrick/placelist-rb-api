#!/usr/bin/python

import requests
import json

data = {
	"email": "test1@tet.com",
	"username": "garfbarf",
	"password": "password",
	"password_confirmation": "password"
}

r = requests.post('http://localhost:3000/user/register', data=data)
print r.status_code
print r.text
