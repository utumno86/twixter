Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers =>{
                 :registrations => 'registrations',
                 :omniauth_callbacks => "users/omniauth_callbacks"
                   }
  
  resources :users
  
  resources :twixts do
    resources :comments
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
