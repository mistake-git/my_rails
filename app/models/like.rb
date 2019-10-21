# frozen_string_literal: true

class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :post

  def user
    User.find_by(id: user_id)
  end
end
