class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :musician, index: true, foreign_key: true
      t.decimal :total, default: 0.0, precision: 7, scale: 2
      t.boolean :payment_status, default: false
      t.boolean :shazam, default: false
      t.boolean :youtube, default: false
      t.boolean :store_maximizer, default: false
      t.timestamps null: false
    end
  end
end
