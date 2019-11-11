class RelationshipsController < ApplicationController
  before_action :set_current_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to("/users/#{user.id}")
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to("/users/#{user.id}")
  end
end