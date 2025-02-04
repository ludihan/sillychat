class Channel < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  has_many :messages
end
