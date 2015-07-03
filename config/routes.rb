Rails.application.routes.draw do
  
  devise_for :users, :controllers =>{
                 :registrations => 'registrations',
                 :omniauth_callbacks => "users/omniauth_callbacks"
                   }
  
  resources :users
  resources :twixts

  resources :users do
    member do
      get :follow, :unfollow
    end
  end

  get 'timeline', to: 'users#timeline', as: 'timeline'
  
  root 'twixts#index'
 
end
