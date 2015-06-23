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

  get 'users/:id/timeline', to: 'users#timeline', as: 'user_timeline'
  
  root 'twixts#index'
 
end
