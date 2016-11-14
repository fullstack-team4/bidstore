class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user
  before_create :check_price_is_greater_than_current_bid
  validates :amount, numericality: {greater_than_or_equal_to: 1}

  def check_price_is_greater_than_current_bid
    binding.pry
    unless  product.bids.present? && amount > product.bids.last.amount
      errors.add(:amount, "Bid must be greater than current bid")
      false
    end
  end


end
