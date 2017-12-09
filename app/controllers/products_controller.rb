class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create]
  # before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Good Job Admin, You Created A Product!"
      redirect_to '/'
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :photo, :description, :price)
  end
end
