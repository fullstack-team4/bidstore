class Admin::BidsController < ApplicationController
  layout "admin"
  def index
    @proucts = Product.all
    @bids = Bid.all
  end

end
