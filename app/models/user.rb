class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team, inverse_of: :users
  has_many :channels
  has_many :links, inverse_of: :user

  validates :team, existence: true
  validates :auth_token, presence: true, uniqueness: true

  before_create :set_auth_token!

  def set_auth_token!
    self.auth_token = self.class.generate_auth_token
  end

  private

    def self.generate_auth_token
      loop do
        token = SecureRandom.base64(100)
        break token unless User.exists?(auth_token: token)
      end
    end
end
