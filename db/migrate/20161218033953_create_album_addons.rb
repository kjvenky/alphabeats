class CreateAlbumAddons < ActiveRecord::Migration
  def change
    create_table :album_addons do |t|
      t.integer :album_id
      t.boolean :youtube
      t.boolean :shazam
      t.boolean :store_maximizer
      t.integer :renewal_status
      t.date :start_date
      t.date :next_renewal_date
      t.integer :number_of_times_renewed

      t.timestamps null: false
    end
  end
end
