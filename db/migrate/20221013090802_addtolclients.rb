class Addtolclients < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :contact
    add_column :clients, :category_time, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
