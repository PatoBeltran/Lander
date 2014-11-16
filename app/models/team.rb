class Team < ActiveRecord::Base
  has_many :users, inverse_of: :team
  has_many :channels, inverse_of: :team


  validates :subdomain, uniqueness: true, presence: true
  validates :name, presence: true

  before_validation :set_subdomain

  accepts_nested_attributes_for :users

  def set_subdomain
    self.subdomain = self.extract_subdomain_from_user_email
  end

  def extract_subdomain_from_user_email
    user_email = self.users.first.email
    user_email.gsub(/.+@([^.]+).+/, '\1')
  end

end
