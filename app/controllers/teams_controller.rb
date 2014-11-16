class TeamsController < ApplicationController
  before_filter :authenticate_user!, only: [:show]

  def new
    @team_registration = TeamRegistration.new
    @team_registration.team.users.build
  end

  def create
    @team = Team.new(team_params)
    @team_registration = TeamRegistration.new(@team, params[:team][:users_attributes]["0"])

    if @team_registration.register
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @team = current_user.team
  end

  private

    def team_params
      params.require(:team).permit(:name, :users_attributes => [:email, :password, :password_confirmation])
    end
end
