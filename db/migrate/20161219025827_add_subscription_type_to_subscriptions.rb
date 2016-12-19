class AddSubscriptionTypeToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :subscription_type, :integer
  end
end
