class TeamRegistration
  attr_reader :team

  def initialize(team = Team.new, user_params = {})
    @team = team
    @user_params = user_params
  end

  def team_already_exists?
    Team.exists? subdomain: @team.extract_subdomain_from_user_email
  end

  def register
    if team_already_exists?
      @team = Team.find_by subdomain: @team.extract_subdomain_from_user_email
      @user_params[:team_id] = @team.id

      User.create(@user_params.to_hash)
    end

    @team.save
  end

end
