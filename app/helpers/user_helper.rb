module UserHelper
  def correct_user
    @user = current_user
    redirect_to(root_path) unless current_user?(@user)
  end
end
