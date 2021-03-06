# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[index show edit update]
  before_action :forbid_login_user, only: %i[new create login_form login]
  before_action :ensure_correct_user, only: %i[edit update]
  before_action :admin_user, only: %i[admin]

  PER = 8

  def index
   @title="ユーザー一覧"
   @users= User.where(activated: true).page(params[:page]).per(PER)
  end

  def search
    @users = User.search(params[:search]).page(params[:page]).per(PER)
    render('users/index')
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to('/posts/index') && return unless @user.activated?
    @user_posts_count = Post.where(user_id: @user.id).count
    @user_likes_post_count = Like.where(user_id: @user.id).count
    @user_comments_count = Comment.where(user_id: @user.id).count
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
      @user.send_activation_email
      flash[:notice] = 'アカウント認証のメールを送信しました'
      redirect_to('/')
    else
      render('users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    pp params
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

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.email == 'test@gmail.com'
      flash[:notice] = 'テストユーザーはユーザーを削除できません'
      return redirect_to("/users/#{@user.id}")

    end
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to('/')
  end

  def login_form; end

  def likes
    @user = User.find_by(id: params[:id])
    redirect_to('/posts/index') && return unless @user.activated?
    @likes = Like.where(user_id: @user.id)
    @user_posts_count = Post.where(user_id: @user.id).count
    @user_likes_post_count = Like.where(user_id: @user.id).count
    @user_comments_count = Comment.where(user_id: @user.id).count
  end

  def comments
    @user = User.find_by(id: params[:id])
    redirect_to('/posts/index') && return unless @user.activated?
    @comments = Comment.where(user_id: @user.id)
    @user_posts_count = Post.where(user_id: @user.id).count
    @user_likes_post_count = Like.where(user_id: @user.id).count
    @user_comments_count = Comment.where(user_id: @user.id).count
  end
  
  def following
    @user  = User.find_by(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find_by(params[:id])
    @users = @user.followers
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = '権限がありません'
      redirect_to('/posts/index')
    end
  end

  def admin
  end

  def password_reset_form; end
    
end
