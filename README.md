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

## Future Planning
##### geocoding
The geocoding gem can be found at https://github.com/alexreisner/geocoder
* Maybe the /places endpoint could just take in latitude and longitude?

