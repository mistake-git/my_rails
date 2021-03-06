# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&&user.authenticate(params[:password])
      if user.activated?
        log_in user
        params[:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = 'ログインしました'
        redirect_to('/posts/index')
      else
        message  = 'アカウントが有効ではありません'
        message += 'メールのアカウント有効化リンクを確認してください'
        flash[:danger] = message
        redirect_to('/')
      end
    else
      flash[:danger] = 'ユーザー名またはパスワードが違います'
      render ('sessions/new')
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
    redirect_to('/')
  end
end
