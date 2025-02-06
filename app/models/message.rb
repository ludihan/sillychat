class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :channel
  after_create_commit { broadcast_append_to self.channel }
end
