class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_blog, only: [:show, :edit, :destroy]

  def index
    @blogs = Blog.includes(:employee).order(created_at: :desc)
    if params[:word].present?
      @blogs = Blog.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
