class Admin::BidsController < ApplicationController
  layout "admin"

  def index
    @proucts = Product.all
    @bids = Bid.all.paginate(:page => params[:page], :per_page => 7)
  end

end
