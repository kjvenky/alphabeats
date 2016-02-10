class ChangeTransactionLogStatus < ActiveRecord::Migration
  def change
    rename_column :transaction_logs, :status, :transaction_status
  end
end
