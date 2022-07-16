class Public::ProductsController < ApplicationController
  before_action :authenticate_employee!, except: [:index, :show]

  def index
    @products = params[:tag_id].present? ? Tag.find(params[:tag_id]).products : Product.includes(:admin).where(is_active: true).order(created_at: :desc)
    @products_page = Product.includes(:admin).page(params[:page])
    if params[:word].present?
      @products = Product.where("name LIKE?", "%#{params[:word]}%").page(params[:page]).order(created_at: :desc)
    end
    @tag_list = Tag.all.page(params[:page])
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
