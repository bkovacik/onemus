class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  before_action :set_session

  def require_login
    unless session[:user]
      redirect_to "/welcome/index"
    end
  end
  def set_session
    if session[:user]
      @sess_user = session[:user]
      @sess_card = session[:card]
    end
  end
end
