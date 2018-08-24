module ApplicationHelper
  def profile_avatar(user)
    @user = User.find(session[:user_id])
    if user.avatar.attachment.present?
      image_tag user.avatar.variant(resize: "150x150")
    else
      image_tag 'default-avatar.png'
    end
  end
end
