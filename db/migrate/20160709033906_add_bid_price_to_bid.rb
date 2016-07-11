class AddBidPriceToBid < ActiveRecord::Migration
  def change
    add_column :bids, :bid_price, :decimal, precision: 7, scale: 2
  end
end
