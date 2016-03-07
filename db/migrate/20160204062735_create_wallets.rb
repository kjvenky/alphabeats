class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.decimal :amount, default: 0.0,  precision: 7, scale: 2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
