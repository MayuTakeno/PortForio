class Public::ProductsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @products = Product.where(is_active: true)
    @product_all = Product.all.where(is_active: true)
  end

  def create
    # 新規登録用のインスタンス用意
    @product = Product.new(product_params)
    # productのemployee_idは現在ログイン中のemployee.idに一致する
    @product.employee_id = current_employee.id
    tag_list = params[:product][:name].split(',')
    if @product.save
      @product.save_tag(tag_list)
      redirect_to public_products_path
    else
      reder :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def product_params
    params.require(:product).permit(:price, :name, :caption, :is_active, :image, :make_day)
  end

end
