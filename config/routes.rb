Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics
  resources :favorites, only: [:index, :create, :destroy]

  post'/comments', to:'comments#create'
end
