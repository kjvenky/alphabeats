class CreateTransactionLogs < ActiveRecord::Migration
  def change
    create_table :transaction_logs do |t|
      t.integer :transaction_type
      t.decimal :amount, precision: 7, scale: 2
      t.integer :status

      t.timestamps null: false
    end
  end
end
