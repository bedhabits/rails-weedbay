class OrdersController < ApplicationController
  before_action :set_order, only: %i[edit update show destroy]

  def index
    # the current user orders
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @order.update(orders_params)
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @current_cart.product_orders.each do |product_order|
      @order.product_orders << product_order
      product_order.cart_id = nil
    end

    @order.user = current_user
    authorize @order

    if @order.save
      redirect_to orders_path
    else
      render :new
    end

    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def order_params
    params.require(:order).permit(:name, :email, :address, :user_id)
  end
end
