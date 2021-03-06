Rails.application.routes.draw do
  
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  get 'pages/index'
  get 'users/new'
  
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
end
