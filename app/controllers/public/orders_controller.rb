class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_employee.cart_items
    @billong_amount = @order.total_items + @order.postage
    @order_new = Order
    if params[:order][:contact] == "1"
      @order = current_employee.email
    elsif params[:order][:contact] == '2'
      @order = current_employee.phone_number
    elsif params[:order][:contact] == '3'
    else
      redirect_to new_public_order_path
      # render :new
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_employee.cart_items
      @cart_items.each do |cart_item|
        ProductOrder.create!(
          product_id: cart_item.product_id,
          order_id: @order.id,
          quantity: cart_item.quantity,
          price: cart_item.product.product.with_tax_price,
          making_status: "no_making"
        )
      end
      current_employee.cart_item.destroy_all
      redirect_to public_orders_conplete_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:billing_amount, :payment_method, :status, :name, :phone_number, :employee_id, :delivery_date)
  end

end
