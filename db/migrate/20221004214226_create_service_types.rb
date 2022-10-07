# frozen_string_literal: true

class CreateServiceTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :service_types do |t|
      t.string :name
      t.decimal :cost
      t.references :service_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
