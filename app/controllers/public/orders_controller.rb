class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.employee_id = current_employee.id
    if @order.save
      # @cart_items = current_employee.cart_items
      # @cart_items.each do |cart_item|
      #   ProductOrder.create!(
      #     product_id: cart_item.product_id,
      #     order_id: @order.id,
      #     quantity: cart_item.quantity,
      #     price: cart_item.product.product.with_tax_price,
      #     making_status: "no_making"
      #   )
      # end
      # current_employee.cart_item.destroy_all
      redirect_to public_confirm_path(@order.id)
    else
      render :new
    end
  end

  def confirm
    @order = Order.find(params[:id])
    @cart_items = current_employee.cart_items
    @total = @cart_items.inject(0) {|sum, product| sum + product.sub_total }
    @order.postage = 200
    @billing_amount = @cart_items.inject(0) {|sum, product| sum + product.sub_total } + @order.postage
    # @order.name = current_employee.name
    # @order.phone_number = current_employee.phone_number
    # @order.status = "no_payment"
    # @order.email = current_employee.email
    # @order.employee_id = current_employee.id
    @order_new = Order.new
    # byebug
    if @order.contact == "1"
      @order.employee.email = current_employee.email
    elsif @order.contact == '2'
      @order.phone_number = current_employee.phone_number
    elsif @order.contact == '3'
    else
      # redirect_to new_public_order_path
      render :new
    end
  end


  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:billing_amount, :payment_method, :status, :name, :phone_number, :employee_id, :delivery_date, :delivery_time, :email, :phone_number, :contact)
  end

end
