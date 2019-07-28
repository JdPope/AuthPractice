class UsersController < ApplicationController
  skip_before_action :authorized
  def create
    @user = User.create(user_params)

    render json: {user_id: @user.id}
  end

  def update

    @user = User.find(params[:id])

    header = request.headers["Authorization"]
    token = header.split(" ").last

    payload = JsonWebToken.decode(token)

    if (@user.id == payload["user_id"].to_i)
      @user.update(user_params)
      render json: { user_id: @user.id}
    else
      render json: { error: "Sorry Dude"}, status: :unauthorized
    end
  end


  private
  def user_params
      params.permit(:username, :password)
  end
end
