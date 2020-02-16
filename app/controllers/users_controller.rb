class UsersController < ApplicationController
  before_action :user_params

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :photo)
  end
end
