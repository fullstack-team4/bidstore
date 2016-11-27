class Notification < ApplicationRecord
  belongs_to :user

  scope :unread, -> { where(is_read: false)}

end
