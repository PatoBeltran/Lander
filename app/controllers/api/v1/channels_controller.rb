class API::V1::ChannelsController < API::V1::BaseController

  before_filter :authenticate_user!

  def index
    channels = current_user.team.channels.page(params[:page]).per(params[:per_page])

    render json: channels, meta: pagination_json(channels, Channel, params[:per_page])
  end
end
