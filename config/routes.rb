Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers =>{
                 :registrations => 'registrations',
                 :omniauth_callbacks => "users/omniauth_callbacks"
                   }
  
  resources :users
  
  resources :twixts do
<<<<<<< HEAD
    resources :comments
=======
    resources :comments, :only => [:create, :destroy]
>>>>>>> 6f4053a1d93e96e6cc851ca7e20512ca7a2fa9e3
  end

  resources :users do
    member do
      get :follow, :unfollow
    end
  end

  get 'timeline', to: 'users#timeline', as: 'timeline'
  get 'search', to: 'users#search', as: 'search'
  
  root 'twixts#index'
 
end
