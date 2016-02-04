# == Schema Information
#
# Table name: transaction_logs
#
#  id               :integer          not null, primary key
#  transaction_type :integer
#  amount           :decimal(7, 2)
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe TransactionLog, type: :model do
    it { should belong_to(:user) }
    it { should have_one(:order) }
    it { should validate_presence_of(:user_id)}
end
