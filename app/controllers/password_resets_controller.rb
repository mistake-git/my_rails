# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :get_user,   only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = 'メールを確認してパスワードをリセットしてください'
      redirect_to('/')
    else
      flash[:danger] = 'メールアドレスが見つかりませんでした'
      render('password_resets/new')
    end
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render('password_resets/edit')
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = 'パスワードをリセットしました'
      redirect_to('/')
    else
      render('password_resets/edit')
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user&&user.activated? &&
           @user&&user.authenticated?(:reset, params[:id])
      redirect_to('/')
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'パスワードリセットの期限切れです'
      redirect_to new_password_reset_url
    end
  end
end
