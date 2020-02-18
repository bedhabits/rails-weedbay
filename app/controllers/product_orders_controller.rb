class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:edit, :update, :destroy]

  def create
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant product_order and iterate quantity otherwise create a new product_order for this product
    if current_cart.products.include?(chosen_product)
      # Find the product_order with the chosen_product
      @product_order = current_cart.product_orders.find_by(product_id: chosen_product)
      # Iterate the product_order's quantity by one
      @product_order.quantity += 1
      # Set price
      @product_order.price = @product_order.product.price
    else
      @product_order = ProductOrder.new
      @product_order.quantity = 0
      @product_order.cart = current_cart
      @product_order.product = chosen_product
      @product_order.price = chosen_product.price
      @product_order.quantity += 1
    end

    authorize @product_order
    # Save and redirect to cart show path
    @product_order.save
    redirect_to cart_path(current_cart)
  end

  def edit
  end

  def update
    if @product_order.update(product_order_params)
      redirect_to order_path(product_order.order)
    else
      render :edit
    end
  end

  def destroy
    authorize @product_order
    @product_order.destroy

    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @product_order = ProductOrder.find(params[:id])
    @product_order.quantity += 1
    @product_order.price = @product_order.product.price
    @product_order.save
    authorize @product_order
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @product_order = ProductOrder.find(params[:id])
    if @product_order.quantity > 1
      @product_order.quantity -= 1
    end
    @product_order.price = @product_order.product.price
    @product_order.save
    authorize @product_order
    redirect_to cart_path(@current_cart)
  end

  private

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id, :cart_id, :price)
  end
end
