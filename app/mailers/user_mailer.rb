class UserMailer < ApplicationMailer
  # encoding: utf-8

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #

  # 日本語で書く方法を見つけないと
  # actionmailer_jaがあるらしい

  def account_activation(user)
    @user = user
    @greeting = "link:"
    mail to: user.email, subject: "Account Activation"
  end

  def password_reset(user)
    @user = user
    @greeting = "link:"
    mail to: user.email, subject: "Password Reset"
  end


end
