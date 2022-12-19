Rails.application.routes.draw do

     resources :trips do
      resources :transportations
      resources :accommodations
      resources :todo_lists do
        resources :todo_items
      end
     end

  root "trips#index"

  resources :users

  resource :session, only: [:new, :create, :destroy]

  resource :calendar, only: [:show]

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"
  
end
