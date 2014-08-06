class UserMailer < ActionMailer::Base
  default from: "recovery@music.ru"
  def change_password_link(user,recovery)
    @user=user
    @recovery=recovery
    @url=reset_path(@recovery.key)
    mail  to: @user.email,
          subject: "Восстановление пароля"
  end
end
