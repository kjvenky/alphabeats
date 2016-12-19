# == Schema Information
#
# Table name: subscription_items
#
#  id              :integer          not null, primary key
#  album_id        :integer
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  itemable_id     :integer
#  itemable_type   :string
#

require 'rails_helper'

RSpec.describe SubscriptionItem, type: :model do
  it {should belong_to(:subscription)}
  # it {should belong_to(:album)}
  it {should belong_to(:itemable) }
end
