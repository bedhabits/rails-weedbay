Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users
  resources :products
  resources :orders do
    collection do
      get 'sold_products'
    end
  end

  get 'carts/:id', to: 'carts#show', as: :cart
  delete 'carts/:id', to: 'carts#destroy'

  post 'product_orders/:id/add', to: 'product_orders#add_quantity', as: :product_order_add
  post 'product_orders/:id/reduce', to: 'product_orders#reduce_quantity', as: :product_order_reduce
  post 'product_orders', to: 'product_orders#create'

  get 'product_orders/:id', to: 'product_orders#show', as: :product_order
  delete 'product_orders/:id', to: 'product_orders#destroy'


end
