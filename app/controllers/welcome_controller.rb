class WelcomeController < ApplicationController
  def index
    flash[:errors] ||= []
  end
  def create
    user_params = params.require(:create).permit(:username, :password, :password_confirmation)
    @user = User.new(user_params)

    unless @user.save
      flash[:errors] = @user.errors.messages.values.flatten
      redirect_to "/welcome/index"
    end
  end
end
