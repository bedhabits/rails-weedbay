Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  namespace :owner do
    resources :products
  end
end
