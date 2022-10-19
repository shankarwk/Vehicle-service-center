class AddClientIdToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :another_request_time, :string
    add_column :clients, :request_count, :integer
    add_column :clients, :alloted_slot, :string
  end
end
