Rails.application.routes.draw do
  
  devise_for :users, :controllers =>{
                 :registrations => 'registrations'
                   }
  
  resources :users
  resources :twixts

  resources :users do
    member do
      get :follow, :unfollow
    end
  end
  
  root 'twixts#index'
 
end
