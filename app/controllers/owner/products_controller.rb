class Owner::ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]



  def index
    @products = current_user.products
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to owner_product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to owner_product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to owner_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
    redirect_to root_path, alert: "fuck you" if @product.user != current_user
  end

  def product_params
    params.require(:product).permit(:name, :origin, :price, :weed_type)
  end
end
