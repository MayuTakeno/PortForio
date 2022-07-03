class Admin::ProductsController < ApplicationController
  # 管理者以外閲覧できない
  before_action :authenticate_admin!

  # private以下にリファクタリング
  before_action :set_product, except: [:new, :create, :index]

  def new
    @product = Product.new
  end

  def create
    # product_paramsに保存
    @product = Product.new(product_params)
    # 保存
    if @product.save
      # 保存完了で製品一覧に遷移
      redirect_to admin_products_path
    else
      render :validater
    end
  end

  def index
    # 商品のすべてnのレコードを取得
    @products = Product.all
  end

  def edit
  end

  def show
  end

  private

  def set_product
    # 新規登録された商品のどれか一つを持ってくる
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :image, :is_active, :name, :caption)
  end

end
