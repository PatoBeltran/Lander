class ApplicationController < ActionController::Base
  include UrlHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_url(subdomain: resource.team.subdomain)
  end

  def current_team
    @current_team ||= current_user.team
  end

  helper_method :current_team

end
