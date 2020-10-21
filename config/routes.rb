Rails.application.routes.draw do
  root to: "home#index"
  #--Session Routes--#
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  delete '/logout', to: 'sessions#destroy', as: 'delete_user_session'

  #--Users Routes--#
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  

  #--Logs Routes--#
  resources :users, only: [] do
    resources :logs
  end
  
  resources :logs

  get '/longest_log', to: 'logs#long_log'
  
  #--Routes Routes--#
  resources :routes
 
  #--Comment Routes--#
  resources :logs, only: [] do 
    resources :comments
  end 




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
