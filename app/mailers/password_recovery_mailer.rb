class PasswordRecoveryMailer < ActionMailer::Base
  default from: "admin@tih.kuban.ru"

  def recovery_pwd(user)
    @user = user
    mail(to: @user.email, subject: 'BKRUG.COM восстановление пароля')
  end

end
