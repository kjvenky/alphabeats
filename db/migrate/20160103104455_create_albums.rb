class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :musician_id

      t.timestamps null: false
      add_foreign_key :albums, :users, column: :musician_id
      add_index :albums, :musician_id
    end
  end
end
