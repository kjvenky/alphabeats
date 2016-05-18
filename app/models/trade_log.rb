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

  validates_presence_of :song_id, :seller_id, :buyer_id, :share, :amount, :transaction_log_id
  validates_numericality_of :song_id, :seller_id, :buyer_id, :transaction_log_id, only_integer: true
  validates_numericality_of :share, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  validates_numericality_of :amount

end