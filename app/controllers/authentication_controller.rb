class AuthenticationController < ApplicationController
  skip_before_action :authorized
  def login
    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      token = JsonWebToken.encode({user_id: @user.id})
      render json: {token: token}
    else
      render json: {error: "sorry dude"}, status: :unauthorized
    end
  end
end
