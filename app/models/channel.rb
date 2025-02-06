class Channel < ApplicationRecord
  validates :name, uniqueness: { message: "%{value} has already been taken." }
  validates :name, presence: true
  scope :public_channels, lambda { where(is_private: false) }
  has_many :messages
  after_create_commit { broadcast_append_to "channels" }
  after_update_commit { broadcast_replace_to "channels" }
  after_destroy_commit { broadcast_remove_to "channels" }
end
