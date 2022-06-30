class Public::BlogsController < ApplicationController
  before_action :authenticate_employee!, except: [:index]
  # before_action :set_blog, only: [:show, :edit]

  def new
    # 空のmodelオブジェクトの生成
    @blog = Blog.new
  end

  def create
    # blogの投稿データを受け取り新規登録
    @blog = Blog.new(blog_params)
    # 投稿した社員を識別するID を 現在ログインしている社員のID に指定
    @blog.employee_id = current_employee.id
    # 受け取ったデータの保存
    if @blog.save
      # 投稿一覧に遷移
      redirect_to public_blog_path(@blog)
    else
      # 元の画面で遷移しない
      render :new
    end
  end

  def index
    @blogs = Blog.all
  end

  def edit
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to public_blogs_path
  end

  private

  # def set_blog
    # @blog = Blog.find(params[:id])
  # end

  def blog_params
    params.require(:blog).permit(:title, :body , :image)
  end

end
