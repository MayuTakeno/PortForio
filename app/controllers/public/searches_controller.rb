class Public::SearchesController < ApplicationController

  def search_blogs
    @range = params[:range]
    if @range == 'Employee'
      @search_employees =Employee.looks(params[:search],params[:word])
    else
      @search_blogs = Blog.looks(params[:search], params[:word])
    end
  end
  
  def search_notices
    @range = params[:range]
    @search_notices = Notice.looks()
  end

end
