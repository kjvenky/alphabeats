# == Schema Information
#
# Table name: trade_logs
#
#  id                 :integer          not null, primary key
#  seller_id          :integer
#  buyer_id           :integer
#  song_id            :integer
#  share              :decimal(8, 5)
#  amount             :decimal(7, 2)
#  transaction_log_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe TradeLog, type: :model do

  it { should belong_to(:song) }
  it { should belong_to(:transaction_log) }
  it { should belong_to(:seller).class_name('User') }
  it { should belong_to(:buyer).class_name('User') }

end
