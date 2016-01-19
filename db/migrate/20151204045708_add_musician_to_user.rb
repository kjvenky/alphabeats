class AddMusicianToUser < ActiveRecord::Migration
  def change
    add_column :users, :musician, :boolean, default: true
  end
end
