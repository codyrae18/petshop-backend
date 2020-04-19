Rails.application.routes.draw do
  post '/signup', to: 'user#create'
  resources :users
  resources :clients
  resources :appointments
  resources :dogs
end
