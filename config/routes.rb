Rails.application.routes.draw do
  root 'pages#home'
  get '/about' => 'pages#about'

  resources :users;
  resources :sessions;
end
