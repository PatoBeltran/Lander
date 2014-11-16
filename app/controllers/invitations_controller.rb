class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    User.invite!(:email => params[:invitation_email], team_id: current_team.id)

    redirect_to root_path
  end
end
