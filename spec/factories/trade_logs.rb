# == Schema Information
#
# Table name: trade_logs
#
#  id                 :integer          not null, primary key
#  seller_id          :integer
#  buyer_id           :integer
#  song_id            :integer
#  share              :decimal(8, 5)
#  amount             :decimal(7, 2)
#  transaction_log_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :trade_log do
    seller_id 1
buyer_id 1
song_id 1
share "9.99"
amount "9.99"
transaction_log_id 1
  end

end
