class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by(cookie: user_params[:cookie])
    if @user
      render json: @user, only: :id, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:cookie)
    end
end