  # == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :decimal(, )
#

class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user
  before_validation :check_price_is_greater_than_current_bid
  # validates :amount, numericality: {greater_than_or_equal_to: 1}
  scope :recent, -> {order("created_at DESC")}

  # def check_price_is_greater_than_current_bid
  #   if product.bid.amount > product.price
  #     @bid.save
  #   else
  #     redirect_to new_product_bid_path
  #     flash[:warning] = "出价过低，请重新出价！"
  #   end
  # end

  scope :recent, -> { order("created_at DESC")}

  def check_price_is_greater_than_current_bid
    unless (product.bids.present? && amount > product.bids.last.amount) or (product.bids.blank? && amount > product.price)
      errors.add(:amount, "Bid must be greater than current bid")
      false
    end
  end

end
