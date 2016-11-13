class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to products_path
  end


  def checkout
    @order = Order.new
  end
end
