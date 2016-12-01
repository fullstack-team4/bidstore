class Account::BidsController < ApplicationController
  layout "account"
  def index
    @bids = current_user.bids.order("created_at DESC").paginate(:page => params[:page], :per_page => 7)
  end
end
