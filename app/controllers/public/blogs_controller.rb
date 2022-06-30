class Public::BlogsController < ApplicationController
  before_action :authenticate_employee!, except: [:index]

  def new
    @blog = Blog.new
  end
  
  def create
  end

  def index
  end

  def edit
  end

  def show
  end

end
