class AddNoteToAdminToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :note_to_admin, :text
  end
end
