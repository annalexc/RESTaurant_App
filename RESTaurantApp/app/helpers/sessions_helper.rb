module SessionsHelper

  def authenticate!
    redirect_to login_path unless current_user
  end

  def current_user
    @currentuser = User.find(session[:user_id]) if session[:user_id]
  end

end

