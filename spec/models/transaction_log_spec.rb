# == Schema Information
#
# Table name: transaction_logs
#
#  id                 :integer          not null, primary key
#  transaction_type   :integer
#  amount             :decimal(7, 2)
#  transaction_status :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  transactable_id    :integer
#  transactable_type  :string
#

require 'rails_helper'

RSpec.describe TransactionLog, type: :model do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user_id)}
    it { should validate_numericality_of(:amount) }
    it { should belong_to(:transactable) }
    # it { should have_one(:trade_log) }
    # it { should have_one(:payment) }
    # it { should have_one(:subscription) }
end
