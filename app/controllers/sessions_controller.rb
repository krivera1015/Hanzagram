class SessionsController < ApplicationController

  def new
  end

  def create
    # Find the user
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # We should go to the first post
      redirect_to new_post_path
    else
      redirect_to login_path
    end
  end

end
