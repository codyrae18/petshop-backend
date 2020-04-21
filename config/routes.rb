Rails.application.routes.draw do
  post '/signup', to: 'user#create'
  post '/adddog', to: 'dog#create'
  resources :users
  resources :clients
  resources :appointments
  resources :dogs
  resources :breeds
end
