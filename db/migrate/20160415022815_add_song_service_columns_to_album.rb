class AddSongServiceColumnsToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :spotify, :string
    add_column :albums, :itunes, :string
    add_column :albums, :apple_music, :string
    add_column :albums, :google_play, :string
    add_column :albums, :amazon, :string
    add_column :albums, :r_dio, :string
    add_column :albums, :deezer, :string
    add_column :albums, :tidal, :string
    add_column :albums, :youtube, :string
    add_column :albums, :microsoft_groove, :string
    add_column :albums, :media_net, :string
  end
end
