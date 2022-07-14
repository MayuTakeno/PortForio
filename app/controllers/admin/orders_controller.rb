class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.includes(:employee).order(created_at: :desc)
  end

  def show
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
