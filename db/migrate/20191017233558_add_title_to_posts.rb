# frozen_string_literal: true

class AddTitleToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :strings
  end
end
