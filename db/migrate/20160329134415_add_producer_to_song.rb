class AddProducerToSong < ActiveRecord::Migration
  def change
    add_column :songs, :producer, :string
    add_column :songs, :producer_email, :string
  end
end
