Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places, :placelists
  resources :users, :except => [:create]
  post '/login', to: 'authentication#authenticate'
  post '/user/register', to: 'user#create'
  post '/placelists/:id', to: 'placelists#add_place'
end
