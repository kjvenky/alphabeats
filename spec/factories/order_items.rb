# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :order_item do
    album nil
order nil
  end

end
