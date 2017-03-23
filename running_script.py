#!/usr/bin/python

import requests
import json

host_url = 'http://localhost:3000'
users_url = host_url + '/users'
places_url = host_url + '/places'
placelists_url = host_url + '/placelists'

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

new_placelist_data = {
	"name": "test_placelist1"
}

update_placelist_data = {
	"place": {
		"name": "<name>",
		"place_type": "<place_type>",
		"street_address": "<street_address>",
		"zip_code": "21227",
		"lon": 16.23519,
		"lat": 72.03458
	}
}

update_user_data = {
	"username": "griffgraff"
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
getPlacelists = False
#	POST /placelists
createPlacelist = False
#	PATCH /placelists/[:id] or PUT /placelists/[:id]
updatePlacelist = False
#	DELETE /placelists/[:id]
deletePlacelist = False
# POST /placelists/1
addPlaceToPlacelist = True

# Booleans for requests which deal with Users
# GET /users/id
showUser = False
# PUT or PATCH /users/id
updateUser = False

# print json.dumps(place_data)

if getPlaces:
	request = requests.get(places_url, headers = auth_headers)
	print_request_info(request)

if createPlace:
	request = requests.post(places_url, headers = auth_headers, data = place_data)
	print_request_info(request)

# Endpoint not implemented yet
if updatePlace:
	# Need to have some sort of data to put in here.
	# Need to talk to Denny to see how the data will be structured
	request = requests.put(place_url + '/1', headers = auth_headers)
	print_request_info(request)

if deletePlace:
	# Need to determine if User 'ownership' of a place is a thing
	# Need to be careful when calling this, because once you delete the thing, it ain't comin back
	request = requests.delete(place_url + '/1', headers = auth_headers)
	print_request_info(request)

if getPlacelists:
	request = requests.get(placelists_url, headers = auth_headers)
	print_request_info(request)

if createPlacelist:
	request = requests.post(placelists_url, headers = auth_headers, data = new_placelist_data)
	print_request_info(request)

if updatePlacelist:
	request = requests.put(placelists_url + '/1', headers = auth_headers, data = update_placelist_data)
	print_request_info(request)

if addPlaceToPlacelist:
	request = requests.post(placelists_url + '/1', headers = auth_headers, data = place_data)
	print_request_info(request)

if showUser:
	request = requests.get(users_url + '/1', headers = auth_headers)
	print_request_info(request)

if updateUser:
	request = requests.put(users_url  + '/1', headers = auth_headers, data = update_user_data)
	print_request_info(request)