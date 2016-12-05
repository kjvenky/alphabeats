# == Schema Information
#
# Table name: subscription_items
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  subscription_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :subscription_item do
    album nil
subscription nil
  end

end
