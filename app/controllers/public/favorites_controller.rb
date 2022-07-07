class Public::FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @favorite = current_employee.favorites.new(blog_id: @blog.id)
    @favorite.save
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @favorite = current_employee.favorites.find_by(blog_id: @blog.id)
    @favorite.destroy
  end

end
