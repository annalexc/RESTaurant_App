Rails.application.routes.draw do
  root 'users#login'

  resources :users, only: [:new, :create]  
  resources :tables do
    resources :parties, only: [:new, :create] 
  end
  resources :customers do
    resources :orders 
  end

  resources :items

  get '/orders'           => "orders#index"
  # resources :parties
  resources :parties
  get '/users/login'      => "users#login", as: :login
  get '/users/parties'    => "users#parties", as: :user_parties
  get '/users/landing'    => "users#landing", as: :landing
  post '/sessions'        => "sessions#create", as: :create_session
  delete '/sessions'      => "sessions#destroy", as: :destroy_session
end
