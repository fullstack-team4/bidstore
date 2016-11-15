class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile, ImageUploader
  mount_uploader :idcard, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, -> (user) {where.not(id: user)}

  def admin?
    is_admin
  end

  def verified?
    is_verified
  end
  
  has_many :orders
  has_many :bids

end
