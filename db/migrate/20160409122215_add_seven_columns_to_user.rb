class AddSevenColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :string
    add_column :users, :stage_name, :string
    add_column :users, :hometown, :string
    add_column :users, :country, :string
    add_column :users, :facebook, :string
    add_column :users, :soundcloud, :string
    add_column :users, :youtube, :string
  end
end
