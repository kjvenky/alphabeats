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

require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:payments) }
  it { should validate_presence_of(:user_id)}
end
