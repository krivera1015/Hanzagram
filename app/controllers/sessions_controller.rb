class SessionsController < ApplicationController

  def new
  end

  def create
    # Find the user
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # We want to show all of the post that are tied to this user
      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

end
