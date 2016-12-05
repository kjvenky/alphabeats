class RenameOrderToSubscription < ActiveRecord::Migration
  def change
    rename_table :orders, :subscriptions
    rename_table :order_items, :subscription_items
  end
end
