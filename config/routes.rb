Rails.application.routes.draw do
  post '/signup', to: 'user#create'
  post '/addpet', to: 'pet#create'
  resources :users
  resources :clients
  resources :appointments
  resources :pets
  resources :breeds
  resources :services
end
