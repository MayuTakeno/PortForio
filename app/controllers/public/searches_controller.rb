class Public::SearchesController < ApplicationController

  def search_blogs
    @range = params[:range]
    @search_blogs = Blog.looks(params[:search], params[:word])
  end

  def search_events
    @range = params[:range]
    @search_events = Event.looks(params[:search], params[:word])
  end

  def search_notices
    @range = params[:range]
    @search_notices = Notice.looks(params[:search], params[:word])
  end

  def search_chats
    @range = params[:range]
    @search_chats = Chat.looks(params[:search], params[:word])
  end

  def search_products
    @range = params[:range]
    @search_products = Product.looks(params[:search], params[:word])
  end

end
