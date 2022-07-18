class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.includes(:employee).page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @product_orders = @order.product_orders
    @total = @order.billing_amount - @order.postage
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @product_orders = @order.product_orders
    # 注文状況ボタン分岐
    if @order.status == "no_payment"
      @product_orders.update(making_status: "no_making")
    elsif @order.status == "confirm_payment"
      @product_orders.update(making_status: "wait_making")
    elsif @order.status == "production"
      @product_orders.update(making_status: "now_making")
    elsif @order.status == "ready_to_ship"
      @product_orders.update(making_status: "complete_making")
    elsif @order.status == "sent"
      @product_orders.update(making_status: "complete_making")
    end
    redirect_to admin_order_path(@order)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:billing_amount, :payment_method, :status, :name, :phone_number, :employee_id, :delivery_date, :delivery_time, :email, :phone_number, :contact)
  end

end
