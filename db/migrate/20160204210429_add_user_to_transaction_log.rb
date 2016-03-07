class AddUserToTransactionLog < ActiveRecord::Migration
  def change
    add_reference :transaction_logs, :user, index: true, foreign_key: true
  end
end
