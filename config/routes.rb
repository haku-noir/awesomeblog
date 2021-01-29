Rails.application.routes.draw do
  root 'pages#home'
  get '/about' => 'pages#about'

  resources :users do
    member do
      get 'followers'
      get 'following_users'
    end
  end
  resources :sessions
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
