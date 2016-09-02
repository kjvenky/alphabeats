# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  song_id     :integer
#  open_status :integer
#  share       :decimal(8, 5)
#  amount      :decimal(7, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offer_price :decimal(7, 2)
#

FactoryGirl.define do
  factory :offer do
    user_id 1
song_id 1
open_status 1
share "9.99"
amount "9.99"
  end

end
