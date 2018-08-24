module ApplicationHelper

  def alert_for(flash_type)
  { success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }[flash_type.to_sym] || flash_type.to_s
  end


  def profile_avatar(user)
    @user = User.find(session[:user_id])
    if user.avatar.attachment.present?
      image_tag user.avatar.variant(resize: "150x150")
    else
      image_tag 'default-avatar.png'
    end
  end
end
