class CreateTradeLogs < ActiveRecord::Migration
  def change
    create_table :trade_logs do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :song_id
      t.decimal :share, precision: 8, scale: 5
      t.decimal :amount, precision: 7, scale: 2
      t.integer :transaction_log_id

      t.timestamps null: false
    end
    add_index :trade_logs, :seller_id
    add_index :trade_logs, :buyer_id
    add_index :trade_logs, :song_id
  end
end
