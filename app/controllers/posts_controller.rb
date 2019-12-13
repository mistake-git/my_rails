# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, only: %i[edit update destroy]

  PER = 8

  def index
    @title="投稿一覧"
    @posts = Post.page(params[:page]).per(PER).order(created_at: :desc)
    @user = @current_user
  end

  def search
    @posts = Post.search(params[:search])
    @posts = @posts.page(params[:page]).per(PER).order(created_at: :desc)
    render 'posts/index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      title: params[:title],
      image: params[:image]
    )
    if @post.save
      flash[:success] = '投稿を作成しました'
      redirect_to('/posts/index')
    else
      render('posts/new')
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(
      content: params[:post][:content],
      title: params[:post][:title]
    )
      if params[:post][:image]
        @post.image.purge
        @post.image.attach(params[:post][:image])
      end
      flash[:sucsess] = '投稿を編集しました'
      redirect_to("/posts/#{@post.id}")
    else
      render('posts/edit')
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to('/posts/index')
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:danger] = '権限がありません'
      redirect_to('/posts')
    end
  end
  
  def following_post
     @user = @current_user
     @posts = @user.feed
  end  

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
