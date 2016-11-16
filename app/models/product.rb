# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  is_hidden   :boolean          default(TRUE)
#  begintime   :datetime
#  endtime     :datetime
#  aasm_state  :string           default("before_auction")
#

class Product < ApplicationRecord

  has_many :bids
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user
  
  def sell!
  self.is_hidden = false
  self.save
  end

  def notsell!
  self.is_hidden = true
  self.save
  end


  include AASM

  aasm do
    state :before_auction, initial: true
    state :during_auction
    state :sold
    state :unsold

    event :start_auction do
      transitions from: [:before_auction, :unsold], to: :during_auction
    end

    event :deal do
      transitions from: :during_auction, to: :sold
    end

    event :fail do
      transitions from: :during_auction, to: :unsold
    end

  end



  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  mount_uploader :image, ImageUploader


end
