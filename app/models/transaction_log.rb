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

class TransactionLog < ActiveRecord::Base
  has_one :order
  belongs_to :user

  validates_presence_of :user_id

end
