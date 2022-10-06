class CreateServiceCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :service_centers do |t|
      t.string :shop_name
      t.string :shop_owner
      t.string :location
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
