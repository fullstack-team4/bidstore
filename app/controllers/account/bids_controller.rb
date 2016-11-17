class Account::BidsController < ApplicationController
  layout "account"
  def index
    @bids = current_user.bids
  end
end
