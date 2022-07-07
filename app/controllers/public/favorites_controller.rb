class Public::FavoritesController < ApplicationController

  def create
    blog = Blog.find(params[:blog_id])
    favorite = current_employee.favorites.new(blog_id: blog.id)
    favorite.save
    redirect_to public_blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    favorite = current_employee.favorites.find_by(blog_id: blog.id)
    favorite.destroy
    redirect_to public_blog_path(blog)
  end

end
