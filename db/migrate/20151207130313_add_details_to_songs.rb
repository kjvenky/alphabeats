class AddDetailsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_title, :string
    add_column :songs, :song_writer, :string
    add_column :songs, :album, :string
    add_column :songs, :stage_band_name, :string
    add_column :songs, :record_label, :string
    add_column :songs, :language, :integer
    add_column :songs, :primary_genre, :integer
    add_column :songs, :secondary_genre, :integer
    add_column :songs, :lyrics, :text
    add_column :songs, :terms, :boolean
    add_column :songs, :release_date, :date
    add_column :songs, :audio_file, :string
    add_column :songs, :album_cover, :string
    add_column :songs, :duration, :time
  end
end
