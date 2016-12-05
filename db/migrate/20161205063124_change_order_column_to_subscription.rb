class ChangeOrderColumnToSubscription < ActiveRecord::Migration
  def change
    rename_column :subscription_items, :order_id, :subscription_id
  end
end
