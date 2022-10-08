class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :status ,  default: "available"
      t.string :name
      t.belongs_to :service_center
      t.timestamps
    end
  end
end
