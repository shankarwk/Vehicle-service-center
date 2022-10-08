class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :vehicle_number
      t.string :contact_number
      t.references :service_center, null: false, foreign_key: true
      t.string :status,:default =>  "not booked"
      t.string :time
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
