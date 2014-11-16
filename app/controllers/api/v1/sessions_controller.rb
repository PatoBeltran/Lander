class API::V1::SessionsController < API::V1::BaseController
  before_action :authenticate_user!, only: [:destroy]

  def create
    user_authentication = UserAuthentication.new(session_params)
    if user_authentication.valid?
      user_authentication.update_user_auth_token!
      render json: user_authentication.user, status: 201
    else
      render json: { user: {errors: ['Bad credentials']}}, status: 401
    end
  end

  def destroy
    user_authentication = UserAuthentication.new(email: current_user.email)

    user_authentication.update_user_auth_token!

    head 204
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
