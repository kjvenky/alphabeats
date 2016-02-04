# == Schema Information
#
# Table name: wallets
#
#  id         :integer          not null, primary key
#  amount     :decimal(7, 2)    default(0.0)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :wallet do
    amount "9.99"
user nil
  end

end
