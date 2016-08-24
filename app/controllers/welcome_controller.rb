class WelcomeController < ApplicationController
  def index
    flash[:messages] ||= []
  end
  def create
    user_params = params.require(:create).permit(:username, :password, :password_confirmation)
    @user = User.new(user_params)

    unless @user.save
      flash[:messages] ||= []
      flash[:messages] += @user.errors.messages.values.flatten
      redirect_to "/welcome/index"
    end
  end
  private
    skip_before_action :require_login
    skip_before_action :set_session
end
