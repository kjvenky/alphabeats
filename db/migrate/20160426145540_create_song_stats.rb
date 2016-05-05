class CreateSongStats < ActiveRecord::Migration
  def change
    create_table :song_stats do |t|
      t.date :reporting_date
      t.string :sale_month
      t.string :store
      t.string :artist
      t.string :title
      t.integer :quantity
      t.string :song_album
      t.decimal :customer_paid, precision: 7, scale: 2
      t.string :customer_currency
      t.string :country_of_sale
      t.string :songwriter_royalties_withheld
      t.decimal :earnings, precision: 7, scale: 2
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
