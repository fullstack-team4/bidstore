class Account::ProductsController < ApplicationController
  layout "account"

  def index
    @products = current_user.participated_products.paginate(:page => params[:page], :per_page => 7)
  end



end
