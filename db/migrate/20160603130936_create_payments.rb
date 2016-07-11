class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :express_token
      t.string :express_payer_id
      t.integer :wallet_id

      t.timestamps null: false
    end
  end
end
