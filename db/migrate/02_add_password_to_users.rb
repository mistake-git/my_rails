# frozen_string_literal: true

class AddPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password, :strings
  end
end
