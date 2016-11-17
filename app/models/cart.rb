# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def clean!
    cart_items.destroy_all
  end

  def add_product_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.quantity = 1
    # ci.endtime = @product.endtime
    # ci.begintime = @product.begintime
    # if @product.endtime-Time.now > 0 && @product.begintime-Time.now < 0
    ci.save
    # else
    #   flash[:warning] = "拍卖结束或尚未开始，请关注竞拍时间！！"
    #   redirect_to new_product_bid_path
    # end
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.quantity * cart_item.product.price
    end
    sum
  end

  def clean!
    cart_items.destroy_all
  end
end
