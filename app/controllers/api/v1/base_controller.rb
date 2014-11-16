class API::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  def authenticate_user!
    authenticate_user_with_token || render_unauthorized
  end

  def authenticate_user_with_token
    authenticate_with_http_token do |token,options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { errors: ['Unauthorized'] }, status: 401
  end

  def current_user
    @current_user
  end
end
