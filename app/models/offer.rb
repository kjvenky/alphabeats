# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  song_id     :integer
#  open_status :integer
#  share       :decimal(8, 5)
#  amount      :decimal(7, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

OFFER_STATUS = { 1 => 'open', 2=>'closed'}
class Offer < ActiveRecord::Base

  belongs_to :user
  belongs_to :song


  validates_presence_of :song_id, :user_id, :share, :open_status, :amount
  validates_numericality_of :song_id, :user_id, :open_status, only_integer: true
  validates_numericality_of :share, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  validates_numericality_of :amount, :offer_price

  def get_offer_status
    OFFER_STATUS[self.open_status]
  end
end
