class Admin::ProductOrdersController < ApplicationController
  def update
    @product_order = ProductOrder.find(params[:id])
    @order = @product_order.order
    @product_orders = @order.product_orders
    @product_order.update(product_order_params)
    # 製造状況ボタン分岐
    if @product_order.making_status == "no_making"
      @order.update(status: "no_payment")
    elsif @product_order.making_status == "wait_making"
      @order.update(status: "no_payment")
    elsif @product_order.making_status == "now_making"
      @order.update(status: "production")
    elsif @product_order.making_status == "complete_making"
      @order.update(status: "ready_to_ship")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def product_order_params
    params.require(:product_order).permit(:making_status)
  end
end
