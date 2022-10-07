# frozen_string_literal: true

class AddColumnInservice < ActiveRecord::Migration[7.0]
  def change
    add_column :service_centers, :slot, :integer
    add_column :service_centers, :available_slot, :integer
    add_column :service_centers, :booked_slot, :integer

    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
