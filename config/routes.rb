Rails.application.routes.draw do
  resources :users
  resources :twixts
  
  root 'twixts#index'
end
