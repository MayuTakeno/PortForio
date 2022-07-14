class Public::BlogsController < ApplicationController
  before_action :authenticate_employee!, except: [:index]
  before_action :set_blog, except: [:new, :index, :create]

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
    @blogs = Blog.includes(:employee).order(created_at: :desc)
    if params[:word].present?
      @blogs = Blog.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
    @blog = Blog.new
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to public_blog_path(@blog)
  end

  def show
    unless ViewCount.find_by(employee_id: current_employee.id, blog_id: @blog.id)
      current_employee.view_counts.create(blog_id: @blog.id)
    end
  end

  def destroy
    @blog.destroy
    redirect_to public_blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body , :image)
  end

end
