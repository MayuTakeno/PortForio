class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:employee).order(created_at: :desc)
  end

  def show
  end
end
