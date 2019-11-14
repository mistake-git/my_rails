# frozen_string_literal: true

class RankingController < ApplicationController
  def ranking
    @all_posts_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @all_users_ranks = User.find(Relationship.group(:followed_id).order('count(followed_id)desc').limit(5).pluck(:followed_id))
  end
end
