class Admin::BidsController < ApplicationController
  def index
    @proucts = Product.all
    @bids = Bid.all
  end
end
