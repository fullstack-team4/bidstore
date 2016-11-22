class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_verified, only:[:create, :new]

  def index
    @product = Product.find(params[:product_id])
    @bids = @product.bids.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @product = Product.find(params[:product_id])
    @bid = Bid.new(bid_params)
    @user = current_user
    @endtime = @product.endtime
    @begintime = @product.begintime

    if @product.endtime-Time.now > 0 && @product.begintime-Time.now < 0
      if @bid.save
        flash[:notice] = "竞价成功！！！."
        redirect_to new_product_bid_path
      else
        flash[:warning] = "竞价失败.请重新出价！！"
        redirect_to new_product_bid_path
      end
    else
      flash[:warning] = "拍卖结束或尚未开始，请关注竞拍时间！！"
      redirect_to new_product_bid_path
    end
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

  # def check_price_is_greater_than_current_bid
  #   if @product.bids.present?
  #     if @bid.amount > @product.bids.last.amount
  #       redirect_to new_product_bid_path
  #     else
  #       return false
  #     end
  #   else
  #     if @bid.amount > @product.price
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end

  private

  def bid_params
    params.require(:bid).permit(:amount, :product_id, :user_id)
  end



end
