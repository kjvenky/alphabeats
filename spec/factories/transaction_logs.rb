# == Schema Information
#
# Table name: transaction_logs
#
#  id                 :integer          not null, primary key
#  transaction_type   :integer
#  amount             :decimal(7, 2)
#  transaction_status :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

FactoryGirl.define do
  factory :transaction_log do
    transaction_type 1
amount "9.99"
status 1
  end

end
