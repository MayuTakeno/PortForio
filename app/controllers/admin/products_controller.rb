class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
  end

  def edit
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :image, :is_active, :name, :caption)
  end

end
