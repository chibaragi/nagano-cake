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

  # 飯田が追記（adminのルートパス）
  # root "clients/products#top"←これも消す
  scope module: :clients do
    root 'products#top'
  end
  namespace :admins do
    root 'orders#top'
  end
  # ここまで

  namespace :admins do
    resources :products, only: [:new, :show, :create, :edit, :index, :update]
  end
  scope module: :clients do
    resources :products, only: [:show, :index]
    get "genres/:id/genre_products" => "products#genre_products"
  end

  namespace :admins do
    # ここから飯田が変更しました（resourcesより先に書かないとうまく表示されない／アクションproduct_orders_update追加／updateをorder_status_updateに変更）
    get "orders/top" => "orders#top"
    patch "orders/order_status" => "orders#order_status_update"
    patch "orders/product_orders_status" => "orders#product_orders_status_update"
    resources :orders, only: [:show, :index]
    # ここまで
  end

  scope module: :clients do
    # ここから飯田が変更しました（resourcesより先に書く/postに変更/=>以降記載）
    post "orders/pre_create" => "orders#pre_create"
    get "orders/confirm_order" => "orders#confirm_order"
    get "orders/after_order" => "orders#after_order"
    # ここまで
    resources :orders, only: [:new, :show, :create, :index]
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

  # 下記追加（飯田）
  # 検索機能
  namespace :admins do
    get 'search' => 'searches#search'
  end
end
