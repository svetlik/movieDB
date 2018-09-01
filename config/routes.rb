Rails.application.routes.draw do
  get 'sessions/new'

  resources :ratings, only: [:new, :create]
  resources :movies do
    get '/rate', to: 'ratings#new'
    post '/rate', to: 'ratings#create'
  end
  resources :categories
  resources :users, only: [:new, :create]
  get '/users', to: redirect('/movies')

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'

  root 'movies#index'
end
