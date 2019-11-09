# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user, token)
    @user = user
    @token = token
    mail to: user.email, subject: 'アカウント認証'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    @user.reset_token #= User.new_token
    mail to: user.email, subject: 'パスワードリセット'
  end
end
