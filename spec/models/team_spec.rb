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

  context "callbacks" do
    context "after_save" do
      describe "create_default_channel!" do
        before do
          @team = FactoryGirl.build(:team)
          @user = FactoryGirl.build(:user, team: @team)

          @team.users << @user
          @team.save
        end

        it "creates a #general channel for the team" do
          expect(@team.channels).to have_exactly(1).item
          expect(@team.channels.first.name).to eql "general"
        end
      end

    end
  end
end
