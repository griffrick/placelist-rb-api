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

place_data = {
	"name": "test place1",
	"place_type": "test type1",
	"street_address": "test address1",
	"state": "test state1",
	"zip_code": "21227",
	"lon": 12.42314,
	"lat": 15.12433,
}

def print_request_info(r):
	print '######################### REQUEST RESULTS #########################'
	print r.status_code
	print r.text
	print '###################################################################'

# Booleans for requests which deal with Places
#	GET /places
getPlaces = False
#	POST /places
createPlace = False
#	GET /places/[:id]
getPlace = False
#	PATCH /places/[:id] or PUT /places/[:id]
updatePlace = False
#	DELETE /places/[:id]
deletePlace = False

# Booleans for requests which deal with Placelists
#	GET /placelists
getPlacelists = True
#	POST /placelists
createPlacelist = False
#	PATCH /placelists/[:id] or PUT /placelists/[:id]
updatePlacelist = False
#	DELETE /placelists/[:id]
deletePlacelist = False

print json.dumps(place_data)

if getPlaces:
	request = requests.get('http://localhost:3000/places', headers = auth_headers)
	print_request_info(request)

if createPlace:
	request = requests.post('http://localhost:3000/places', headers = auth_headers, data = place_data)
	print_request_info(request)

# Endpoint not implemented yet
if updatePlace:
	# Need to have some sort of data to put in here.
	# Need to talk to Denny to see how the data will be structured
	request = requests.put('http://localhost:3000/places/2', headers = auth_headers)
	print_request_info(request)

if deletePlace:
	# Need to determine if User 'ownership' of a place is a thing
	# Maybe places should just be web scraped and auto-added to the database?
	# Maybe leafly has an API
	request = requests.delete('http://localhost:3000/places/2', headers = auth_headers)
	print_request_info(request)


if getPlacelists:
	request = requests.get('http://localhost:3000/placelists', headers = auth_headers)
	print_request_info(request)
