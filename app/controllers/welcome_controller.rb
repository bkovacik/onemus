class WelcomeController < ApplicationController
  def new
  end
  def create
    user_params = params.require(:create).permit(:username, :password)
    @user = User.new(user_params)

    @user.save
  end
end
