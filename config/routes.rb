Rails.application.routes.draw do
  namespace :admins do
    get 'admins/show'
    get 'admins/index'
  end
  devise_for :admins
  devise_for :clients

  scope module: :clients do
  	get "clients" => "clients#show"
  	get "clients/withdrawal" => "clients#withdrawal"
  	patch "clients/withdrawal" => "clients#withdrawal"
  	get "clients/edit" => "clients#edit"
  end

  #get 'clients/show'
  #get 'clients/withdrawal'
  #get 'clients/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
