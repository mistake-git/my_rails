# frozen_string_literal: true

class AddIntroduceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduce, :strings
  end
end
