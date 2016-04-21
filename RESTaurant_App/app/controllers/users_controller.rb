class UsersController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def new
    @user = User.new
  end

  def create
    user = User.create user_params
    redirect_to login_path
  end

  def login
  end

  def landing
    @user = current_user
  end

  def profile
    @user = current_user
    @tables = Table.where(user_id: @user.id)
  end

  def parties
    @user = current_user
    @parties = Party.where(user_id: @user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
