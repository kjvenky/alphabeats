class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.references :musician, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
