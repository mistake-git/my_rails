# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[index show edit update]
  before_action :forbid_login_user, only: %i[new create login_form login]
  before_action :ensure_correct_user, only: %i[edit update]
  before_action :admin_user, only: %i[admin]

  PER = 8

  def index
    @users = User.page(params[:page]).per(PER)
    
  end

  def search
    @users = User.search(params[:search]).page(params[:page]).per(PER)
    render('users/index')
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to("/users/#{@user.id}")
    else
      render('users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(
      name: params[:user][:name],
      email: params[:user][:email],
      introduce: params[:user][:introduce]
    )
      if params[:user][:image]
        @user.image.purge
        @user.image.attach(params[:user][:image])
      end
      flash[:notice] = 'ユーザー情報を編集しました'
      redirect_to("/users/#{@user.id}")
    else
      render('users/edit')
    end
  end

  def login_form; end

  def login
    @user = User.find_by(email: params[:email])
    if # frozen_string_literal: true
@user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to('/posts/index')
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to('/login')
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def comments
    @user = User.find_by(id: params[:id])
    @comments = Comment.where(user_id: @user.id)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = '権限がありません'
      redirect_to('/posts/index')
    end
  end

  def admin; end
end
