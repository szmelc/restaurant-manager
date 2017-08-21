Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :meals
  resources :orders   
  resources :users
  get '/orders_today', to: 'orders#orders_today'
  get '/orders_all', to: 'orders#orders_all'

  resources :dishes
end
