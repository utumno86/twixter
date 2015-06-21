Rails.application.routes.draw do
  
  devise_for :users, :controllers =>{
                 :registrations => 'registrations'
                   }
  
  resources :users
  resources :twixts

  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  
  root 'twixts#index'
 
end
