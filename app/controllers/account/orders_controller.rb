class Account::OrdersController < ApplicationController

  layout "account"

  def index
    @orders = current_user.orders.paginate(:page => params[:page], :per_page => 7)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    # @product = @order.products
  end

  # def buyout
  #   @product = Product.find(params[:product_id])
  #   @order = Order.new
  #   @order.user = current_user
  #   @product_list = @order.product_lists.build
  #   @product_list.product_id = @product.id
  #   @product_list.save
  #   @order.save
  #
  #   redirect_to account_order_path(@order), notice: "buyout"
  #
  # end

  # def new
  #   @order = Order.new
  #   # @product = @order.products
  # end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def return
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    redirect_to account_orders_path
  end


  def shipped
    @order = Order.find_by_token(params[:id])
    @order.deliver!
    redirect_to account_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :is_paid, :payment_method, :aasm_state)
  end

end
