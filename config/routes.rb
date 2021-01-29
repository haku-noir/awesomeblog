Rails.application.routes.draw do
  root 'pages#home'
  get '/about' => 'pages#about'

  resources :users
  resources :sessions
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
