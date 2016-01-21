class AddThreeCoverSongColumnsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :self_written, :boolean
    add_column :songs, :original_artist, :string
    add_column :songs, :original_song_title, :string
  end
end
