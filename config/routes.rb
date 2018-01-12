Rails.application.routes.draw do
  root to: "posts#index"
  get 'admin/index'
	get :search, controller: :main
  devise_for :users, :path_prefix => 'my'
    resources :users
  resources :meals
  resources :orders
  resources :users
  resources :pinned_posts
  resources :dishes
  resources :posts do
    resources :comments
  end
  get '/admin', to: 'admin#index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id/edit' => 'users#edit', :via => :get, :as => :admin_edit_user
end
