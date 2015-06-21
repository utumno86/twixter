Rails.application.routes.draw do
  
  devise_for :users, :controllers =>{
                 :registrations => 'registrations'
                   }
  
  resources :users
  resources :twixts
  resources :users do
    member do
      get :following, :followers
    end
  end

  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  
  root 'twixts#index'
 
end
