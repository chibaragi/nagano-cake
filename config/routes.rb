# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  devise_for :clients, controllers: {
    registrations: 'clients/registrations',
    sessions: 'clients/sessions',
    confirmations: 'clients/confirmations',
    mailer: 'clients/mailer',
    passwords: 'clients/passwords',
    shared: 'clients/shared',
    unlocks: 'clients/unlocks'
  }

  root 'clients/products#top'

  namespace :admins do
    resources :products, only: %i[new show create edit index update]
  end
  scope module: :clients do
    resources :products, only: %i[show index]
    get 'genres/:id/genre_products' => 'products#genre_products'
  end

  namespace :admins do
    resources :orders, only: %i[show index update]
    get 'orders/top' => 'orders#top'
  end

  scope module: :clients do
    resources :orders, only: %i[new show create index]
    get 'orders/pre_create'
    get 'orders/confirm_order'
    get 'orders/after_order'
  end
  scope module: :clients do
    resources :clients, only: %i[show edit]
    get 'clients/withdrawal' => 'clients#withdrawal'
    patch 'clients/withdrawal' => 'clients#withdrawal'
  end
  scope module: :clients do
    resources :inside_carts, only: %i[create index update destroy]
    delete 'inside_carts' => 'inside_carts#destroy_all'
  end

  scope module: :clients do
    resources :shipping_addresses, only: %i[new create edit update destroy]
  end

  namespace :admins do
    resources :genres, only: %i[create index update edit]
  end
  namespace :admins do
    resources :inside_carts, only: [:update]
  end
  namespace :admins do
    resources :clients, only: %i[show index]
  end
end
