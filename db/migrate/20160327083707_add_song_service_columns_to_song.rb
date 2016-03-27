class AddSongServiceColumnsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :spotify, :string
    add_column :songs, :itunes, :string
    add_column :songs, :apple_music, :string
    add_column :songs, :google_play, :string
    add_column :songs, :amazon, :string
    add_column :songs, :r_dio, :string
    add_column :songs, :deezer, :string
    add_column :songs, :tidal, :string
    add_column :songs, :youtube, :string
    add_column :songs, :microsoft_groove, :string
    add_column :songs, :media_net, :string
  end
end
