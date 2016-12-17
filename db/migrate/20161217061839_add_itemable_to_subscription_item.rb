class AddItemableToSubscriptionItem < ActiveRecord::Migration
  def change
    add_reference :subscription_items, :itemable, polymorphic: true, index: true
  end
end
