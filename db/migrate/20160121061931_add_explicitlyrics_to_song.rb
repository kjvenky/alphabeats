class AddExplicitlyricsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :explicit_lyrics, :boolean
  end
end
