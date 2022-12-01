Rails.application.routes.draw do

  
  resources :trips

  root "trips#index"
  
end
