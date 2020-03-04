Rails.application.routes.draw do
  root to: "home#index"
  #--Session Routes--#
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'delete_user_session'

  #--Users Routes--#
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  #--Climbing Routes Routes--#
  resources :users, only: [] do
    resources :logs
  end
 
  resources :routes
 
  #--Comment Routes--#
  resources :logs, only: [] do 
    resources :comments
  end 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
