class UserAuthentication
  attr_reader :user

  def initialize(options = {})
    @email = options[:email]
    @password = options[:password]
    @user = User.find_by(email: @email)
  end

  def user_exists?
    @user.present?
  end

  def valid_password?
    @user.valid_password?(@password)
  end

  def valid?
    user_exists? and valid_password?
  end

  def update_user_auth_token!
    @user.update_attribute(:auth_token, generate_auth_token)
  end

  def generate_auth_token
    loop do
      token = SecureRandom.base64(100)
      break token unless User.exists?(auth_token: token)
    end
  end
end
