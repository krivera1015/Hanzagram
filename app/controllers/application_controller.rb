class ApplicationController < ActionController::Base
  def current_user
    #check session user and set to instance variable to use other in controllers
    @user = User.find(sessions[:user_id])
  end
end
