class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[大咖私藏] 感谢完成本次下单，以下是您这次的购物明细 #{order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: "service@bidstore.com", subject: "[大咖私藏] 用户#{order.user.email}申请取消订单 #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[大咖私藏] 您的订单 #{order.token}已发货")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[大咖私藏] 您的订单 #{order.token}已取消")
  end

end
