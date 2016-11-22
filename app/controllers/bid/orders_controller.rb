class Bid::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :pay_with_alipay, :pay_with_wechat]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    # binding.pry
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.create(order_params)
    @order.user = current_user
    #binding.pry
    @product = Product.find(params[:order][:product_id])

    if @order.save

        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = @product.title
        product_list.product_price = @product.bids.last.amount
        product_list.save
      #end
      #current_cart.clean!
      OrderMailer.notify_order_placed(@order).deliver!

      redirect_to order_path(@order.token)
    else
      #render 'carts/checkout'
      redirect_to order_path(@order.token)
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

   def pay_with_alipay
     @order = Order.find_by_token(params[:id])
     @order.set_payment_with!("alipay")
     @order.make_payment!
     redirect_to order_path(@order.token), notice: "支付宝付款成功"
   end

   def pay_with_wechat
     @order = Order.find_by_token(params[:id])
     @order.set_payment_with!("wechat")
     @order.make_payment!
     redirect_to order_path(@order.token), notice: "微信付款成功"
   end

   def apply_to_cancel
     @order = Order.find(params[:id])
     OrderMailer.apply_cancel(@order).deliver!
     flash[:notice] = "已提交申请"
     redirect_to :back
   end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :payment_method)
  end

end
