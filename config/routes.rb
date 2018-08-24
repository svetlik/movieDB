Rails.application.routes.draw do
  get 'sessions/new'
  resources :movies
  resources :categories
  resources :users, only: [:new, :create]
  get '/users', to: redirect('/movies')

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'

  root 'movies#index'
end
