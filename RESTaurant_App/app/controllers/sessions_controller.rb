class SessionsController < ApplicationController

  def create
    # Get username and password fields from login form
    username = params[:username]
    password = params[:password]

    # Set variable user to the associated Server object with the provided username
    user = User.find_by(username: username)
    
    # Authenticate user password
    if user && user.authenticate(password)
      

      # I now have a session hash that I can work with, :user_id is unique in this case
      session[:user_id] = user.id
      redirect_to profile_path
    else
      redirect_to login_path
    end   

  end

  # destroy ession
  def destroy
    session[:user_id] = nil
    # sets user id key to nil

    redirect_to login_path
    
  end
end
