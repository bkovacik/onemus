class SessionsController < ApplicationController
  def login
    print "%", session[:user], "%", params, "%"
    if session[:user].nil?
      if params[:login].nil?
        logout
      else
        authenticate
      end
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
    reset_session
    redirect_to "/welcome/index"
  end
end
