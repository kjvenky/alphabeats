# == Schema Information
#
# Table name: bids
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  song_id     :integer
#  open_status :integer
#  share       :decimal(8, 5)
#  amount      :decimal(7, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bid_price   :decimal(7, 2)
#

BID_STATUS = { 1 => 'open', 2=>'closed', 3 => 'partially traded' }
class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates_presence_of :song_id, :user_id, :share, :open_status, :amount
  validates_numericality_of :song_id, :user_id, :open_status, only_integer: true
  validates_numericality_of :share, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  validates_numericality_of :amount, :bid_price


  def get_bid_status
    BID_STATUS[self.open_status]
  end



end
