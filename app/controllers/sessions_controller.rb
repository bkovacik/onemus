class SessionsController < ApplicationController
  def login
    unless params[:login].nil?
      authenticate
    else
      logout
    end
  end
  def authenticate
    username = params[:login]["username"]
    password = params[:login]["password"]
    
    user = User.where("username=?", username)
    if user.empty?
      logout
      (flash[:messages] ||= []) << "User not found."
      return
    end

    if BCrypt::Password.new(user.first["password_digest"]) == password
      session[:user] = username
      session[:card] = user.first["card_access"]
    else
      logout
      (flash[:messages] ||= []) << "Incorrect password."
    end
  end
  def logout
    (flash[:messages] ||= []) << "Logged out."
    reset_session
    redirect_to "/welcome/index"
  end
end
