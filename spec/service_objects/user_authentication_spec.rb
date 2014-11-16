require 'rails_helper'

RSpec.describe UserAuthentication do

  it { should respond_to :user }


  describe '#user_exists?' do
    before do
      user = FactoryGirl.build :user
      team = FactoryGirl.create :team, users: [user]

      @user_authentication = UserAuthentication.new({email: user.email, password: "12345678"})
    end

    it 'returns true when the user exists' do
      expect(@user_authentication.user_exists?).to eq true
    end
  end

  describe '#valid_password?' do
    before do
      user = FactoryGirl.build :user
      team = FactoryGirl.create :team, users: [user]

      @user_authentication = UserAuthentication.new({email: user.email, password: "12345678"})
    end

    it 'returns true when the user exists' do
      expect(@user_authentication.valid_password?).to eq true
    end
  end

  describe '#valid?' do
    before do
      user = FactoryGirl.build :user
      team = FactoryGirl.create :team, users: [user]

      @user_authentication = UserAuthentication.new({email: user.email, password: "12345678"})
    end

    it 'returns true when the user exists' do
      expect(@user_authentication).to be_valid
    end
  end
end
