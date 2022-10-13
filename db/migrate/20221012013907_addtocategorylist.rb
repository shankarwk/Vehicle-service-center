class Addtocategorylist < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :contact,:integer
    remove_column :clients, :time
    remove_column :clients, :date
    add_column :clients, :request_time,:string
    

    
  end
end

