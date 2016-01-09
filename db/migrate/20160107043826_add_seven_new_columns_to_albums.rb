class AddSevenNewColumnsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :stage_band_name, :string
    add_column :albums, :release_date, :date
    add_column :albums, :record_label, :string
    add_column :albums, :album_cover, :string
    add_column :albums, :language, :integer
    add_column :albums, :primary_genre, :integer
    add_column :albums, :secondary_genre, :integer
  end
end
