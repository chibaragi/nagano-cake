Rails.application.routes.draw do
  get 'clients/show'
  get 'clients/withdrawal'
  get 'clients/edit'
  devise_for :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
