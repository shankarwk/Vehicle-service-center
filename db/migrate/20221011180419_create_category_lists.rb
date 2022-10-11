class CreateCategoryLists < ActiveRecord::Migration[7.0]
  def change
    create_table :category_lists do |t|
      t.string :name
      t.decimal :cost
      t.string :time

      t.timestamps
    end
  end
end
