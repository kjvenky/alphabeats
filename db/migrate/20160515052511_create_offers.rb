class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :open_status
      t.decimal :share, precision: 8, scale: 5
      t.decimal :amount, precision: 7, scale: 2

      t.timestamps null: false
    end
    add_index :offers, :user_id
    add_index :offers, :song_id
  end
end
