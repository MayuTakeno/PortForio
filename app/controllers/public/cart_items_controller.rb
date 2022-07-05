class Public::CartItemsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @cart_items = current_employee.cart_items
    @total = @cart_items.inject(0) {|sum, product| sum + product.sub_total }
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    p @new_cart_item
    if CartItem.find_by(product_id: @new_cart_item.product_id, employee_id: current_employee.id)
      @cart_item = CartItem.find_by(product_id: @new_cart_item.product_id, emoloyee_id: current_employee.id)
      @cart_item.quantity += @new_cart_item.quantity
      @cart_item.save
    else
      @new_cart_item.save
    end
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :employee_id, :product_id)
  end
end
