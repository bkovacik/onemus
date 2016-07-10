class WelcomeController < ApplicationController
  def create
    user_params = params.require(:create).permit(:username, :password, :password_confirmation)
    @user = User.new(user_params)

    unless @user.save
      flash[:errors] = @user.errors.messages.values
      redirect_to "/welcome/index"
    end
  end
end
