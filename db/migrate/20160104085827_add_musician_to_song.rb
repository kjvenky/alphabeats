class AddMusicianToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :user, index: true, foreign_key: true
  end
end
