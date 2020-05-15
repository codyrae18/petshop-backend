Rails.application.routes.draw do
  post '/signup', to: 'user#create'
  post '/addpet', to: 'pet#create'
  resources :clients
  resources :appointments
  resources :pets
  resources :breeds
  resources :services

  namespace :api do 
    resources :users, only: [:create, :index, :show]
   post '/login', to: 'auth#create'
   get '/profile', to: 'users#profile'
  end
end
