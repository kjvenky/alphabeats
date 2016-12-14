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
  # it { should belong_to(:transaction_log) }
  it { should belong_to(:seller).class_name('User') }
  it { should belong_to(:buyer).class_name('User') }
  it { should have_one(:transaction_log) }

  
  it { should validate_presence_of(:buyer_id) }
  it { should validate_presence_of(:song_id) }
  it { should validate_presence_of(:seller_id) }
  it { should validate_presence_of(:share) }
  it { should validate_presence_of(:amount) }
  # it { should validate_presence_of(:transaction_log_id) }

  it { should validate_numericality_of(:seller_id).only_integer }
  it { should validate_numericality_of(:song_id).only_integer }
  it { should validate_numericality_of(:buyer_id).only_integer }
  # it { should validate_numericality_of(:transaction_log_id).only_integer }

  it { should validate_numericality_of(:share).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
  it { should validate_numericality_of(:amount) }

end
