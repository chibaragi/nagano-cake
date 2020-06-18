Rails.application.routes.draw do
<<<<<<< HEAD
=======

>>>>>>> develop
  devise_for :admins, :controllers => {
     registrations: "admins/registrations",
     sessions: "admins/sessions"
   }
<<<<<<< HEAD
  devise_for :clients, :controllers => {
=======

  devise_for :clients, controllers:{
>>>>>>> develop
     registrations: "clients/registrations",
     sessions: "clients/sessions",
     confirmations: "clients/confirmations",
     mailer: "clients/mailer",
     passwords: "clients/passwords",
     shared: "clients/shared",
     unlocks: "clients/unlocks"
   }
<<<<<<< HEAD
=======

>>>>>>> develop
  root "clients/products#top"
  namespace :admins do
    resources :products, only: [:new, :show, :create, :edit, :index, :update]
  end
  scope module: :clients do
<<<<<<< HEAD
    # resources :jenres, only: [:show, :index]
    # get "products/genre_products"
    resources :products, only: [:show, :index]
    get "genres/:id/genre_products"  => "products#genre_products"
=======
    resources :products, only: [:show, :index]
    get "genres/:id/genre_products" => "products#genre_products"
  end
>>>>>>> develop

  end
  namespace :admins do
    resources :orders, only: [:show, :index, :update]
    get "orders/top" => "orders#top"
  end
  scope module: :clients do
    resources :orders, only: [:new, :show, :create, :index]
    get "orders/pre_create"
    get "orders/confirm_order"
    get "orders/after_order"
<<<<<<< HEAD
    # デモ
    post "orders/new"
=======
>>>>>>> develop
  end
  scope module: :clients do
    resources :clients, only: [:show, :edit]
    get "clients/withdrawal" => "clients#withdrawal"
    patch "clients/withdrawal" => "clients#withdrawal"
  end
  scope module: :clients do
    resources :inside_carts, only: [:create, :index, :update, :destroy]
    delete "inside_carts" => "inside_carts#destroy_all"
  end
  scope module: :clients do
    resources :shipping_addresses, only: [:new, :create, :edit, :update, :destroy]
  end
  namespace :admins do
    resources :genres, only: [:create, :index, :update, :edit]
  end
  namespace :admins do
    resources :inside_carts, only: [:update]
  end
  namespace :admins do
    resources :clients, only: [:show, :index]
  end
<<<<<<< HEAD
end
=======
end 
>>>>>>> develop
