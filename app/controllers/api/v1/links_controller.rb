class API::V1::LinksController < API::V1::BaseController
  before_filter :authenticate_user!

  def index
    links = current_user.team.links.page(params[:page]).per(params[:per_page])

    render json: links, meta: pagination_json(links, Link, params[:per_page])
  end

  def create
    team = current_user.team
    link = team.links.build(link_params)
    link.user_id = current_user.id

    if link.save
      render json: link, status: 201
    else
      render json: { link: { errors: link.errors.full_messages } }, status: 422
    end

  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :channel_id, :tag_list)
    end
end
