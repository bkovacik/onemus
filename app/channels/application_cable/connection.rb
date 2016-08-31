# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :u_id

    def connect
      #Sets u_id to session[:user] 
      self.u_id = cookies.encrypted[Rails.application.config.session_options[:key]]['user']
    end
  end
end
