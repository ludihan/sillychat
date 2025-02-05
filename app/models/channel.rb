class Channel < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  validates :name, presence: true
  scope :public_channels, lambda { where(is_private: false) }
  has_many :messages
end
