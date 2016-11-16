class Account::OrdersController < ApplicationController

  layout "account"

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    # @product = @order.products
  end

  def buyout
    # @product = Product.find(params[:product_id])
    # current_user.cart.add_product_to_cart(@product)

  end

  def new
    @order = Order.new
    # @product = @order.products
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method, :aasm_state)
  end

end
