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
    @order = Order.new(orders_params)
    @order.user = current_user
    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def orders_params
    params.require(:orders).permit(:status, :address)
  end
end