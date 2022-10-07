# frozen_string_literal: true

class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_rule, :string, default: 'user '
    remove_column :users, :rule, :string
  end
end
