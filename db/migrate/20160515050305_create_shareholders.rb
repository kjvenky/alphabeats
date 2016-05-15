class CreateShareholders < ActiveRecord::Migration
  def change
    create_table :shareholders do |t|
      t.integer :song_id
      t.integer :user_id
      t.decimal :share, precision: 8, scale: 5

      t.timestamps null: false
    end
    add_index :shareholders, :song_id
    add_index :shareholders, :user_id
  end
end
