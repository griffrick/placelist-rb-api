Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'authentication#authenticate'
  post '/user/register', to: 'user#create'
end
