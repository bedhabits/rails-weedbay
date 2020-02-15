Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products
  resources :orders, except: :new
end
