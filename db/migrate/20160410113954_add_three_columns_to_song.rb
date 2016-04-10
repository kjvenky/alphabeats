class AddThreeColumnsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :view_count, :integer
    add_column :songs, :download_count, :integer
    add_column :songs, :income_till_date, :decimal, precision: 7, scale: 2
  end
end
