class TeamsController < ApplicationController
  def new
    @team = Team.new
    @team.users.build
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :users_attributes => [:email, :password, :password_confirmation])
    end
end
