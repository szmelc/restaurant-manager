Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :meals
  resources :orders
  resources :dishes
end
