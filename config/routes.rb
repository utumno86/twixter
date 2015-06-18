Rails.application.routes.draw do
  
  devise_for :users
  resources :twixts
  
  root 'twixts#index'
end
