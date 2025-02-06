class User < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  validates :name, presence: true
  validates :password, presence: true
  scope :all_except, lambda { |user| where.not(id: user) }
  has_many :messages
  after_create_commit { broadcast_append_to "users" }
  after_update_commit { broadcast_replace_to "users" }
  after_destroy_commit { broadcast_remove_to "users" }
end
