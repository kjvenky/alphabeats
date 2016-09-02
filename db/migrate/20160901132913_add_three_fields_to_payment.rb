class AddThreeFieldsToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :transaction_log_id, :integer
    add_column :payments, :paypal_id, :string
    add_column :payments, :payment_type, :integer, :null => false, :default => 1
  end
end
