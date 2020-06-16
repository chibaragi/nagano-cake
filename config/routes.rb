Rails.application.routes.draw do

  devise_for :admins
  devise_for :clients

  root "clients/products#top"

  namespace :admins do
    get 'products' => "products#index"
    get 'products/new'
    get 'products/:id' => "products#show"
    get 'products/:id/edit' => "products#edit"
    post "products" => "products#create"
    patch "products/:id" => "products#update"
  end

  scope module: :clients do
    get 'products' => "products#index"
    get 'products/:id' => "products#show"
    get 'products/genre_products'
  end

  namespace :admins do
    get 'orders' => "orders#index"
    get 'orders/top' => "orders#top"
    get 'orders/show/:id' => "orders#show"
    patch "orders/update/:id" => "orders#update"
  end

  scope module: :clients do
    get 'orders/new'
    get 'orders/pre_create'
    get 'orders/confirm_order'
    get 'orders/after_order'
    get 'orders' => "orders#index"
    get 'orders/:id' => "orders#show"
  end

  namespace :admins do
   # get "admins/" => "devise/sessions#new"
    get 'admins/show'
    get 'admins/index'
  end

  scope module: :clients do
  	get "clients" => "clients#show"
  	get "clients/withdrawal" => "clients#withdrawal"
  	patch "clients/withdrawal" => "clients#withdrawal"
  	get "clients/edit" => "clients#edit"
  end

  scope module: :clients do
    get 'inside_carts' => "inside_carts#index"
    patch "inside_carts/:id" => "inside_carts#update"
    delete "inside_carts/:id" => "inside_carts#destroy"
    delete "inside_carts" => "inside_carts#destroy_all"
    post "inside_carts" => "inside_carts#create"
  end

   scope module: :clients do
    get 'shipping_addresses/new'
    get 'shipping_addresses/:id/edit' => "shipping_addresses#edit"
    post 'shipping_addresses' => "shipping_addresses#create"
    patch 'shipping_addresses/:id/' => "shipping_addresses#update"
    delete 'shipping_addresses/:id' => "shipping_addresses#destroy"
  end

  namespace :admins do
    get 'genres' => "genres#index"
    post "genres" => "genres#create"
    get "genres/:id/edit" => "genres#edit"
    patch "genres/:id" => "genres#update"
  end

  namespace :admins do
    patch "product_orders/:id" => "product_orders#update"
  end

 end
