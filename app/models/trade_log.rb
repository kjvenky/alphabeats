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

class TradeLog < ActiveRecord::Base

  belongs_to :song
  belongs_to :transaction_log
  belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, :class_name => 'User', :foreign_key => 'seller_id'

end
