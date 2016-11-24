class Account::BidsController < ApplicationController
  layout "account"
  def index
    @bids = current_user.bids.paginate(:page => params[:page], :per_page => 8)
  end
end
