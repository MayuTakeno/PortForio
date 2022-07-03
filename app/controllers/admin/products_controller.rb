class Admin::ProductsController < ApplicationController
  # 管理者以外閲覧できない
  before_action :authenticate_admin!

  # private以下にリファクタリング
  before_action :set_new, only: [:new, :create]
  before_action :set_product, except: [:new, :create, :index]

  def new
  end

  def create
    # 保存
    if @product.save
      # 保存完了で製品一覧に遷移
      redirect_to admin_products_path
    else
      # 遷移しない
      render :new
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

  def set_new
    # 商品の新規登録
    @product = Product.new
  end

  def set_product
    # 新規登録された商品のどれか一つを持ってくる
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :image, :is_active, :name, :caption)
  end

end
