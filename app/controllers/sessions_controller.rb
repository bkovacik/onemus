class SessionsController < ApplicationController
  def login
    if !session[:user]
      authenticate
    end
  end
  def authenticate
    username = params[:login]["username"]
    password = params[:login]["password"]
    
    user = User.where("username=?", username)
    puts "%", user.class, "%"
    if user.empty?
      logout
      flash[:errors] = "User not found."
      return
    end

    if BCrypt::Password.new(user.first["password_digest"]) == password
      session[:user] = username
      session[:card] = user.first["card_access"]
    else
      logout
      flash[:errors] = "Incorrect password."
    end
  end
  def logout
    reset_session
    redirect_to "/welcome/index"
  end
end
