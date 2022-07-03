class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
