Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    registrations: "admins/registrations",
    sessions: "admins/sessions",
  }
  devise_for :clients, controllers: {
    registrations: "clients/registrations",
    sessions: "clients/sessions",
    confirmations: "clients/confirmations",
    mailer: "clients/mailer",
    passwords: "clients/passwords",
    shared: "clients/shared",
    unlocks: "clients/unlocks",
  }
  scope module: :clients do
    root 'products#top'
    # 商品
    resources :products, only: %i[show index]
    get 'genres/:id/genre_products' => 'products#genre_products'
    # 注文
    post "orders/pre_create" => "orders#pre_create"
    get "orders/confirm_order" => "orders#confirm_order"
    get "orders/after_order" => "orders#after_order"
    resources :orders, only: [:new, :show, :create, :index]
    # 会員
    get "clients/withdrawal" => "clients#withdrawal"
    patch "clients/withdrawal" => "clients#withdrawal"
    resources :clients, only: [:show, :edit, :update, :destroy]
    # カート
    resources :inside_carts, only: [:create, :index, :update, :destroy]
    delete 'inside_carts' => 'inside_carts#destroy_all'
    # 登録先住所 
    resources :shipping_addresses, only: %i[new create edit update destroy]
  end

  namespace :admins do
    root 'orders#top'
    # 商品
    resources :products, only: %i[new show create edit index update]
    # 注文
    get "orders/top" => "orders#top"
    patch "orders/order_status" => "orders#order_status_update"
    patch "orders/product_orders_status" => "orders#product_orders_status_update"
    resources :orders, only: [:show, :index]
    # ジャンル
    resources :genres, only: %i[create index update edit]
    # カート
    resources :inside_carts, only: [:update]
    # 会員
    resources :clients, only: [:show, :index, :edit, :update, :destroy]
    # 検索
    get 'search' => 'searches#search'
  end
end
