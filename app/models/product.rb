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

  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :begintime, presence: true
  validates :endtime, presence: true
  mount_uploader :image, ImageUploader

  has_many :photos
  has_many :bids
  has_many :cart_items
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user
  has_many :product_lists
  accepts_nested_attributes_for :photos

  acts_as_messageable

  def send_message_before_auction(product, user)
    t = product.begintime - Time.now
    admin = User.first
    users = product.members
    # body = "点击链接查看商品"link_to(@product.title, product_path(@product))
    subject = "#{product.title}马上开拍"
    if t <= 1800 && users.present?
      admin.send_message(users, body, subject)
      flash[:success] = "Message has been sent!"
    end
  end


  def send_message_after_auction(product, user)
    t = Time.now - product.endtime
    admin = User.first
    users = product.members
    body = "#{product.title}已结束拍卖，感谢关注"
    subject = "#{product.title}已结束拍卖，感谢关注"
    if t >=0 && users.present?
      admin.send_message(users, body, subject)
      flash[:success] = "Message has been sent!"
    end
  end


  def time_before_start(start_time, end_time)
    seconds_diff = (Time.now - begintime).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "距离开拍还有#{hours.to_s.rjust(2, '0')}小时#{minutes.to_s.rjust(2, '0')}分钟#{seconds.to_s.rjust(2, '0')}秒"
  end

  def time_before_end(start_time, end_time)
    seconds_diff = (Time.now - endtime).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "距离结束还有#{hours.to_s.rjust(2, '0')}小时#{minutes.to_s.rjust(2, '0')}分钟#{seconds.to_s.rjust(2, '0')}秒"
  end


  #  def time_left
  #    t = endtime - Time.now
  #    t
  #  end
  # start_time = DateTime.new(Time.now)
  # end_time = DateTime.new(endtime)
  # TimeDifference.between(start_time, end_time).humanize
  # => {:years=>0, :months=>12, :weeks=>0, :days=>}


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





end
