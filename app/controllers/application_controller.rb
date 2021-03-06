# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user
  include SessionsHelper

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user.nil?
      flash[:danger] = 'ログインが必要です'
      redirect_to('/login_form')
    end
  end

  def forbid_login_user
    if @current_user
      flash[:danger] = 'すでにログインしています'
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def admin_user
    unless @current_user.admin?
      flash[:danger] = '管理者権限がありません'
      redirect_to('/posts/index')
    end
  end
end
