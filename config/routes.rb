Rails.application.routes.draw do
  get 'sessions/new'
  resources :movies
  resources :users
  resources :categories

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'

  root 'movies#index'
end
