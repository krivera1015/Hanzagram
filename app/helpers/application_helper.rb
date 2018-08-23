module ApplicationHelper
  def profile_avatar(user)
    @user = User.find(session[:user_id])
    if user.avatar.attachment.present?
      image_tag user.avatar
    else
      image_tag 'default-avatar.jpg'
    end
  end
end
