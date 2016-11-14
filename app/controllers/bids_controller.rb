class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids = Bid.all
  end

  def create
    @product = Product.find(params[:product_id])
    @bid = Bid.new(bid_params)

    if @bid.save
      # flash[:notice] = "竞价成功！！！."
      redirect_to new_product_bid_path
    else
      flash[:warning] = "竞价失败.请重新出价！！"
      redirect_to new_product_bid_path
    end

    # if @product.bids.present?
    #   if @bid.amount > @product.bids.last.amount
    #     @bid.save
    #     flash[:notice] = "Bid has been successfully placed."
    #     redirect_to product_bids_path
    #   else
    #     flash[:warning] = "竞价失败.请重新出价！！"
    #     redirect_to new_product_bid_path
    #   end
    # else
    #   if @bid.amount > @product.price
    #     @bid.save
    #     flash[:notice] = "Bid has been successfully placed."
    #     redirect_to product_bids_path
    #   else
    #     flash[:warning] = "竞价失败.请重新出价！！"
    #     redirect_to new_product_bid_path
    #   end
    # end

    # if @bid.amount > @product.bi
    #   flash[:notice] = "Bid has been successfully placed."
    #   redirect_to product_bids_path
    # else
    #   flash[:warning] = "竞价失败.请重新出价！！"
    #   redirect_to new_product_bid_path
    # end
  end


  def show
    @product = Product.find(params[:product_id])
    @bid = Bid.new(params[:id])
    @bid.user = current_user
    @bid.product = @product
  end

  def new
    @product = Product.find(params[:product_id])
    @bid = Bid.new
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :product_id, :user_id)
  end



end
