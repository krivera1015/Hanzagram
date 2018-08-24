class SessionsController < ApplicationController

  before_action :authorized, except: [:show, :new, :create]

  def new
  end

  def create
    # Find the user
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # We want to show all of the post that are tied to this user
      redirect_to profile_path(@user.username)
    else
      redirect_to login_path
    end
  end

  def show

  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

private
  def authorized
    redirect_to login_path unless session[:user_id]
  end

end
