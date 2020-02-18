Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products
  resources :orders, except: :new
  resources :product_orders, only: %i[create edit update destroy]
end
