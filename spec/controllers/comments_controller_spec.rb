# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]

  def create
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to("/posts/#{params[:post_id]}")
    else
      redirect_to("/posts/#{params[:post_id]}")
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to("/posts/#{params[:post_id]}")
  end

  def ensure_correct_user
    @comment = Comment.find_by(id: params[:comment_id])
    if @comment.user_id != @current_user.id
      flash[:notice] = '権限がありません'
      redirect_to("/posts/#{params[:post_id]}")
    end
  end
end
