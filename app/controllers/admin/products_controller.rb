class Admin::ProductsController < ApplicationController
  # 管理者以外閲覧できない
  before_action :authenticate_admin!

  # private以下にリファクタリング
  before_action :set_product, except: [:new, :create, :index]

  def new
    @product = Product.new
  end

  def create
    # product_paramsに新規登録
    @product = Product.new(product_params)
    # productのemployee_idは現在ログイン中のemployee.idに一致する
    @product.admin_id = current_admin.id
    tag_list = params[:product][:name].split(',')
    # 保存
    if @product.save
      @product.save_tag(tag_list)
      # 保存完了で製品一覧に遷移
      redirect_to admin_products_path
    else
      render :validater
    end
  end

  def index
    # 商品のすべてnのレコードを取得
    @products = Product.all
    @tag_list = Tag.all
  end

  def edit
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def set_product
    # 新規登録された商品のどれか一つを持ってくる
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :image, :is_active, :name, :caption, :make_day)
  end

end
