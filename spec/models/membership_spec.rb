# == Schema Information
#
# Table name: memberships
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  renewal_status          :integer
#  start_date              :date
#  next_renewal_date       :date
#  number_of_times_renewed :integer          default(0)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe Membership, type: :model do

  it { should belong_to(:user) }
  # it { is_expected.to have_one(:subscription_item) }
  it { should have_one(:subscription_item) }

  it do
    should define_enum_for(:renewal_status).
      with([:expired, :active])
  end
end
