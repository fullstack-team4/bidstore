class Admin::OederController < ApplicationController
  layout "admin"

  before_action :authenticate_user
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order = Order.find(params[:id])
    @order.canell_order!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :good 
  end

end
