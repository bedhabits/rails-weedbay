Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  namespace :owner do
    resources :products
  end
end
