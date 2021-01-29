Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'pages#home'
  get '/about' => 'pages#about'

  resources :users
  resources :sessions
  resources :microposts, only: [:create, :destroy]
end
