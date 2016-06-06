# == Schema Information
#
# Table name: payments
#
#  id               :integer          not null, primary key
#  express_token    :string
#  express_payer_id :string
#  wallet_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :payment do
    express_token "MyString"
express_payer_id "MyString"
wallet_id 1
  end

end
