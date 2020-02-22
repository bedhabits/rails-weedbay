  class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @products = Product.all
    if params[:search]
      @products = policy_scope(Product).product_search(params[:search][:query])
    else
      @products = policy_scope(Product)
    end
      @session = session[:cart_id]
  end

  def new
    @product = Product.new
    authorize @product
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product was updated'
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product

    if @product.save
      redirect_to @product, notice: 'Product was created'
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to root_path, notice: 'Product was deleted'
  end

  private

  def product_params
    params.require(:product).permit(:name, :origin, :price, :weed_type, :photo_url)
  end

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end
end
