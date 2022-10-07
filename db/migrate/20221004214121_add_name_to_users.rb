# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rule, :string
  end
end
