class AddTouserpayment < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_customer_id, :string
    add_column :users, :membership, :integer, default: 0
    add_column :users, :name, :string
    add_column :clients, :next_date, :string
  end
end
