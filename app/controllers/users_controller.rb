class UsersController < ApplicationController

  before_action :authorized, except: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end


private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def authorized
    redirect_to login_path unless session[:user_id]
  end

end
