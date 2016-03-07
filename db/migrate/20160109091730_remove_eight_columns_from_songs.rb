class RemoveEightColumnsFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :album, :string
    remove_column :songs, :stage_band_name, :string
    remove_column :songs, :record_label, :string
    remove_column :songs, :language, :integer
    remove_column :songs, :primary_genre, :integer
    remove_column :songs, :secondary_genre, :integer
    remove_column :songs, :release_date, :date
    remove_column :songs, :album_cover, :string
  end
end
