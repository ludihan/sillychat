class Channel < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  scope :public_channels, lambda { where(is_private: false) }
  has_many :messages
end
