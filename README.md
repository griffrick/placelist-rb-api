# README

## Starting the API
You need to have rails installed and you need to be in the root directory.

Execute the command:
```
rails server
```
to start the API. This will be running on your computer, and reachable at localhost:3000

##### Available Routes
```
$ rails routes
       Prefix Verb   URI Pattern               Controller#Action
       places GET    /places(.:format)         places#index
              POST   /places(.:format)         places#create
        place GET    /places/:id(.:format)     places#show
              PATCH  /places/:id(.:format)     places#update
              PUT    /places/:id(.:format)     places#update
              DELETE /places/:id(.:format)     places#destroy
   placelists GET    /placelists(.:format)     placelists#index
              POST   /placelists(.:format)     placelists#create
    placelist GET    /placelists/:id(.:format) placelists#show
              PATCH  /placelists/:id(.:format) placelists#update
              PUT    /placelists/:id(.:format) placelists#update
              DELETE /placelists/:id(.:format) placelists#destroy
        users GET    /users(.:format)          users#index
              POST   /users(.:format)          users#create
         user GET    /users/:id(.:format)      users#show
              PATCH  /users/:id(.:format)      users#update
              PUT    /users/:id(.:format)      users#update
              DELETE /users/:id(.:format)      users#destroy
        login POST   /login(.:format)          authentication#authenticate
user_register POST   /user/register(.:format)  user#create

```

## Tests
Tests can be found in the running_script.py file. It should be pretty self explanatory

## Future Planning
##### geocoding
The geocoding gem can be found at https://github.com/alexreisner/geocoder
* Maybe the /places endpoint could just take in latitude and longitude?

## Questions
1. What exactly will the data coming in look like for a POST to /places
  * Maybe it could just be latitude and longitude and the API could take care of constructing things like address, etc
2. What will POST requests to /placelists look like?
3. Should unauthenticated users be able to get any information back at all?
 * Things like places aren't private
 * Although having a log in page before they can access the app wouldn't necessarily be all that bad
4. Maybe a DELETE request to a page would remove all associations of the current user and that Place.
