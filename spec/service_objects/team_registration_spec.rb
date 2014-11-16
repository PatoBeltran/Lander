require 'rails_helper'

RSpec.describe TeamRegistration do

  it { should respond_to :team }


  describe "#team_already_exists?" do
    context 'when the team already exists' do

      before do
        user = FactoryGirl.build :user
        team = FactoryGirl.create :team, users: [user]

        @team_registration = TeamRegistration.new(team)
      end

      it "returns true when the team already exists" do
        expect(@team_registration.team_already_exists?).to eql true
      end
    end
  end

  describe "#register" do

    context 'when the team already exists' do
      before do
        @team = FactoryGirl.create :team_with_user_attributes

        new_user_attributes = { email: "anotheruser@#{@team.subdomain}.com", password: "12345678", password_confirmation: "12345678" }

        @team_registration = TeamRegistration.new(@team, new_user_attributes)
      end

      it "Adds the user to the team" do
        expect{@team_registration.register}.to change{@team_registration.team.users.count}.by(1)
      end
    end

    context 'when the team does not exists' do
      before do
        @team = FactoryGirl.build :team_with_user_attributes

        @team_registration = TeamRegistration.new(@team)
      end

      it 'saves the team object' do
        expect{@team_registration.register}.to change{Team.count}.by(1)
      end

      it 'saves the user object' do
        expect{@team_registration.register}.to change{User.count}.by(1)
      end
    end
  end
end
