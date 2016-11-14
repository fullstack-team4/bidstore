class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user
  before_validation :check_price_is_greater_than_current_bid
  validates :amount, numericality: {greater_than_or_equal_to: 1}


  # def check_price_is_greater_than_current_bid
  #   if product.bid.amount > product.price
  #     @bid.save
  #   else
  #     redirect_to new_product_bid_path
  #     flash[:warning] = "出价过低，请重新出价！"
  #   end
  # end

  def check_price_is_greater_than_current_bid

    if product.bids.present?
      if amount > product.bids.last.amount
        return true
      else
        return false
      end
    else
      if amount > product.price
        return true
      else
        return false
      end
    end

    # if product.bids.present?
    #   if amount > product.bids.last.amount
    #     return true
    #   else
    #     return false
    #   end
    # else
    #   if amount > product.price
    #     return true
    #   else
    #     return false
    #   end
    # end
    # puts "!!!!!!!!!!!!!!!!amount:#{amount}"
    # puts "!!!!!!!!!!!!!!!!product.bids.last.amount:#{product.bids.last.amount}"
    # puts "#{amount > product.bids.last.amount}"
    #
    # if product.bids.present? && amount > product.bids.last.amount
    #
    #   puts "!!!!!!!!!!!!!!!!!!!!!!!!valid"
    #   return true
    # else
    #   errors.add(:amount, "Bid must be greater than current bid")
    #   puts "!!!!!!!!!!!!!!!!!!!!!!!!invalid"
    #   return false
    # end
  end

end
