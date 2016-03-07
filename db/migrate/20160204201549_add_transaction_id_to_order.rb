class AddTransactionIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :transaction_log, index: true, foreign_key: true
  end
end
