class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:edit, :update, :destroy]

  def create
    raise
    @product_order = ProductOrder.new(product_order_params)
    @product = Product.find(params[:product_id])
    @order = Order.find(params[:order_id])

    @product_order.product = @product
    @product_order.order = @order

    if @product_order.save
      redirect_to order_path(produt_order.order)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_order.update(product_order_params)
      redirect_to order_path(produt_order.order)
    else
      render :edit
    end
  end

  def destroy
    @product_order.destroy
    redirect_to order_path(produt_order.order)
  end

  private

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end

  def product_order_params
    params.require(:product_order).permit(:quantity)
  end
end
