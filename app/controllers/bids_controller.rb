class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids = Bids.order("created_at DESC")
  end

  def create
    @product = Product.find(params[:product_id])
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.product = @product

    if @bid.save
      redirect_to @bid.product, flash: {success: "Bidded"}
    else
      redirect_to @bid.product, flash: {warning: "bid must be higher than current bid"}
    end
  end

  private

  def bid_params
    params.require(:bid)permit(:amount, :product_id)  
  end

end
