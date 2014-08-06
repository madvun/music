class UserMailer < ActionMailer::Base
  default from: "recovery@music.ru"
  def change_password_link(user,recovery)
    @user=user
    @recovery=recovery
    mail  to: @user.email,
          subject: "Восстановление пароля"
  end
end
