Rails.application.routes.draw do

  
  resources :trips

  root "trips#index"

  resources :users

  resource :session, only: [:new, :create, :destroy]

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"
  
end
