Rails.application.routes.draw do
  resources :movies

  get  '/login',  to: 'login#new'
  get  '/signup',  to: 'user#new'

  root 'home#index'
end
