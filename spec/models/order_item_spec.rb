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

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it {should belong_to(:order)}
  it {should belong_to(:album)}
end
