class Account::OrdersController < ApplicationController

  layout "account"

  def index
    @orders = current_user.orders
  end
end
