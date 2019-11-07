# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      user.activate
      log_in user
      flash[:success] = 'アカウントが有効になりました'
      redirect_to('/posts/index')
    else
      flash[:danger] = 'リンクが無効です'
      redirect_to('/')
    end
  end
end
