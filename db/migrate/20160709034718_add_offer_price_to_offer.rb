class AddOfferPriceToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :offer_price, :decimal, precision: 7, scale: 2
  end
end
