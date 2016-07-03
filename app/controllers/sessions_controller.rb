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

    if BCrypt::Password.new(user.first["password_digest"]) == password
      session[:user] = username
      session[:card] = user.first["card_access"]
    end
  end
  def logout
    puts "Logging out..."
    reset_session
    redirect_to "/welcome/index"
  end
end
