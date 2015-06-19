Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  devise_for :users
  resources :users
  resources :twixts

  
  root 'twixts#index'
 
end
