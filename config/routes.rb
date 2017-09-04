Rails.application.routes.draw do
  get 'admin/index'

	get :search, controller: :main
  devise_for :users
  root to: "home#index"
  resources :meals
  resources :orders
  resources :users
  get '/orders_today', to: 'orders#orders_today'
  get '/orders_all', to: 'orders#orders_all'
  resources :dishes
  get '/admin', to: 'admin#index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id/edit' => 'users#edit', :via => :get, :as => :admin_edit_user
end
