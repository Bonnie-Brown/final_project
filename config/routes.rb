Rails.application.routes.draw do


  # shallow do
  #   resources :trips do
  #     resources :details do
  #       resources :transportations
  #       resources :accomodations
  #     end
  #     resources :todo_lists do
  #       resources :todo_items
  #     end
  #   end
  # end


     resources :trips do
      resources :transportations
      resources :accommodations
     end





  root "trips#index"

  resources :users

  resource :session, only: [:new, :create, :destroy]

  


  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"
  
end
