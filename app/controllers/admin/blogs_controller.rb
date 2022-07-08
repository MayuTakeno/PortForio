class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_blog, only: [:show, :edit, :destroy]

  def index
    @blogs = Blog.all
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
