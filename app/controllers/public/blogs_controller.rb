class Public::BlogsController < ApplicationController
  before_action :authenticate_employee!, except: [:index]

  def new
  end

  def index
  end

  def edit
  end

  def show
  end
end
