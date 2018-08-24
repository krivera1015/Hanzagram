class UsersController < ApplicationController

  before_action :authorized, except: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_profile_path(@user.username)
    else
      flash[:alert] = "Username must be atleast 4 characters, no more than 16 characters!"
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

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def authorized
    redirect_to login_path unless session[:user_id]
  end

end
