Rails.application.routes.draw do
  
  devise_for :users, :controllers =>{
                 :registrations => 'registrations'
                   }
  
  resources :users
  resources :twixts

  #a bit of a leap with member? this is weird
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root 'twixts#index'
 
end
