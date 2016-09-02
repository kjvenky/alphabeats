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
#
TRANSACTION_STATUS = { 1 => 'success', 2=>'failure', 3=> 'pending' }
TRANSACTION_TYPE = { 1 => 'from wallet', 2=> 'deposit from bank into wallet', 3 => 'to wallet', 4 => 'withdrawl from wallet'}
#Transaction types - bank to wallet, wallet to wallet, wallet to bank
class TransactionLog < ActiveRecord::Base
  has_one :order
  belongs_to :user
  has_one :trade_log
  has_one :payment

  validates_presence_of :user_id
  validates_numericality_of :amount


  def get_transaction_status
    TRANSACTION_STATUS[self.transaction_status]
  end

  def get_transaction_type
    TRANSACTION_TYPE[self.transaction_type]
  end

  module TransactionStatus
    SUCCESS = 1
    FAILURE = 2
    PENDING = 3
  end

  module TransactionType
    FROM_WALLET = 1
    FROM_BANK = 2
    TO_WALLET = 3
    WITHDRAWL_FROM_WALLET = 4
  end
end
