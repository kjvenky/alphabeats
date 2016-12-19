# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  total              :decimal(7, 2)    default(0.0)
#  payment_status     :boolean          default(FALSE)
#  shazam             :boolean          default(FALSE)
#  youtube            :boolean          default(FALSE)
#  store_maximizer    :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  transaction_log_id :integer
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should validate_presence_of(:user_id)}
  it { should belong_to(:musician).class_name('User') }
  it { should validate_numericality_of(:total) }
  it { should have_one(:transaction_log) }

  it { should have_many(:subscription_items) }

  it do
    should define_enum_for(:subscription_type).
      with([:membership, :albumaddon])
  end
end
