class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    # @order = Order.find(params[:id])
    @cart_items = current_employee.cart_items
    @order_new = Order.new
    @postage = 200
    @total = @cart_items.inject(0) {|sum, product| sum + product.sub_total }
    @billing_amount = @cart_items.inject(0) {|sum, product| sum + product.sub_total } + @order.postage
    if @order.contact == '1'
      @order.email = current_employee.email
    elsif @order.contact == '2'
      @order.phone_number = current_employee.phone_number
    elsif @order.contact == '3'
    else
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.employee_id = current_employee.id
    if @order.save
      @cart_items = current_employee.cart_items
      @cart_items.each do |cart_item|
        @product_order = ProductOrder.new
        @product_order.product_id = cart_item.product_id
        @product_order.order_id = @order.id
        @product_order.quantity = cart_item.quantity
        @product_order.price = cart_item.product.with_tax_price
        @product_order.making_status = "no_making"
        @product_order.save
      end
      current_employee.cart_items.destroy_all
      redirect_to public_orders_complete_path
    else
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to public_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:billing_amount, :payment_method, :status, :name, :phone_number, :employee_id, :delivery_date, :delivery_time, :email, :phone_number, :contact)
  end

end
