Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  resources :twixts

  
  root 'twixts#index'
 
end
