Rails.application.routes.draw do
  root 'users#login'

  resources :users, only: [:new, :create]  
  resources :tables

  get '/users/login'  => "users#login", as: :login
  get '/users/profile' => "users#profile", as: :profile

  post '/sessions'    => "sessions#create", as: :create_session
  delete '/sessions'  => "sessions#destroy", as: :destroy_session
end
