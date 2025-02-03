class MessagesController < ApplicationController
  before_action :set_channel

  def create
    @channel.messages.create! params.expect(message: [ :content ])
    redirect_to @channel
  end

  private
    def set_post
      @channel = Channel.find(params[:channel_id])
    end
end
