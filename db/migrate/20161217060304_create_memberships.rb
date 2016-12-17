class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :renewal_status
      t.date :start_date
      t.date :next_renewal_date
      t.integer :number_of_times_renewed, :default => 0

      t.timestamps null: false
    end
  end
end
