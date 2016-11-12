class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def clean!
    cart_items.destroy_all
  end

  def checkout
    @order = Order.new
  end
end
