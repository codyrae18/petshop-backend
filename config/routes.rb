Rails.application.routes.draw do
  resources :users
  resources :clients
  resources :appointments
  resources :dogs
end
