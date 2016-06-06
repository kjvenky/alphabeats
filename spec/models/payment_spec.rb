# == Schema Information
#
# Table name: payments
#
#  id               :integer          not null, primary key
#  express_token    :string
#  express_payer_id :string
#  wallet_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:wallet) }

end
