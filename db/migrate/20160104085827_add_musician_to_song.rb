class AddMusicianToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :musician, index: true, foreign_key: true
  end
end
