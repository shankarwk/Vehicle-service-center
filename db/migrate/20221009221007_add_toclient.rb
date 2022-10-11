class AddToclient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :category, :string
    add_column :clients, :cost, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
