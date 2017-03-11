#!/usr/bin/python

import requests
import json

login_data = {
	"email": "rickleg93@gmail.com",
	"username": "griffgraff",
	"password": "password",
}

login_request = requests.post('http://localhost:3000/login', data=login_data)
print login_request.status_code
print login_request.text

auth_token = json.loads(login_request.text)["auth_token"]

auth_headers = {
	"Authorization": auth_token
}

place_request = requests.get('http://localhost:3000/places', headers=auth_headers)
print place_request.status_code
print place_request.text
print place_request