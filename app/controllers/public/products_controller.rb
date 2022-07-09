class Public::ProductsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @products = params[:tag_id].present? ? Tag.find(params[:tag_id]).products : Product.where(is_active: true)
    @product_all = Product.all.where(is_active: true)
    @tag_list = Tag.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @product_tags = @product.tags
  end

  private

  def product_params
    params.require(:product).permit(:price, :name, :caption, :is_active, :image, :make_day)
  end

end
