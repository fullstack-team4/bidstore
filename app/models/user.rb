# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  profile                :string
#  name                   :string
#  idcard                 :string
#  is_verified            :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile, ImageUploader
  mount_uploader :idcard, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, -> (user) {where.not(id: user)}

  acts_as_messageable

  def admin?
    is_admin
  end

  def verified?
    is_verified
  end

  def favor?(product)
    participated_products.include?(product)
  end

  def favor!(product)
    participated_products << product
  end

  def quit!(product)
    participated_products.delete(product)
  end

  has_many :orders
  has_many :bids
  has_many :products
  has_many :product_relationships
  has_many :participated_products, :through => :product_relationships, :source => :product
  has_many :notifications
end
