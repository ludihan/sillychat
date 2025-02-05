class User < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  validates :name, presence: true
  validates :password, presence: true
  scope :all_except, lambda { |user| where.not(id: user) }
  has_many :messages
end
