class ChannelsController < ApplicationController
  before_filter :authenticate_user!

  def create
    channel = current_team.channels.build(channel_params)
    channel.creator_id = current_user.id

    if channel.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

    def channel_params
      params.require(:channel).permit(:name)
    end
end
