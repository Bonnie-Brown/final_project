Rails.application.routes.draw do


  shallow do
    resources :trips do
      resources :details do
        resources :transportations
        resources :accomodations
      end
    end
  end

  root "trips#index"

  resources :users

  resource :session, only: [:new, :create, :destroy]

  


  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"
  
end
