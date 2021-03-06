class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_username(login_params[:username])
    if @user.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      puts token
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username },
             status: :ok,
             key_transform: :camel_lower
    else
      render json: { error: 'unauthorized' },
             status: :unauthorized,
             key_transform: :camel_lower
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
