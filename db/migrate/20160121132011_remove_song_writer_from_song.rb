class RemoveSongWriterFromSong < ActiveRecord::Migration
  def change
    remove_column :songs, :song_writer, :string
  end
end
