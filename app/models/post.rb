# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  validates :title, presence: true

  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

  def user
    User.find_by(id: user_id)
  end
end
