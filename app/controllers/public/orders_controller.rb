class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_employee.cart_items
      @cart_items.each do |cart_item|
        ProductOrder.create!(
          
        )|
      redirect_to public_order_path(order)
    else
      render :request.referer
    end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:billing_amount, :payment_method, :status, :name, :phone_number, :employee_id)
  end

end
