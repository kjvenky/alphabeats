class UsersTableMusicianColumnDefaultValueFalse < ActiveRecord::Migration
  def change
    change_column_default :users, :musician, from: true, to: false
  end
end
