require 'rails_helper'

RSpec.describe Team, :type => :model do

  describe "extract_subdomain_from_user_email" do
    before do
      @team = FactoryGirl.build(:team)
      @user = FactoryGirl.build(:user, email: "javo@icalialabs.com", team: @team)

      @team.users << @user
    end
    
    it "returns the subdomain from the user email" do
      expect(@team.extract_subdomain_from_user_email).to eql "icalialabs"
    end
  end
end
