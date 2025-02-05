class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show edit update destroy ]

  # GET /channels or /channels.json
  def index
    @current_user = current_user
    redirect_to "/signin" unless @current_user

    @channels = Channel.public_channels
    @users = User.all_except(@current_user)
  end

  # GET /channels/1 or /channels/1.json
  def show
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels or /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: "Channel was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1 or /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: "Channel was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1 or /channels/1.json
  def destroy
    @channel.messages.all.destroy_all
    @channel.destroy!

    respond_to do |format|
      format.html { redirect_to channels_path, status: :see_other, notice: "Channel was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      begin
        @channel = Channel.find(params.expect(:id))
      rescue ActiveRecord::RecordNotFound => e
        redirect_to "/404"
      end
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.expect(channel: [ :name ])
    end
end
