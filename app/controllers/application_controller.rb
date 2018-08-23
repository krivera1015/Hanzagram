class ApplicationController < ActionController::Base

  helper_method :is_loggedin?, :current_user

  def current_user
    #check session user and set to instance variable to use other in controllers
    if session[:user_id]
    @user = User.find(session[:user_id])
    end
  end

  def is_loggedin?
    !!current_user
  end

end
