class Product < ApplicationRecord

  has_many :bids
  


  def sell!
  self.is_hidden = false
  self.save
  end

  def notsell!
  self.is_hidden = true
  self.save
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  mount_uploader :image, ImageUploader


end
