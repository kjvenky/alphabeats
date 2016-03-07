# == Schema Information
#
# Table name: wallets
#
#  id         :integer          not null, primary key
#  amount     :decimal(7, 2)    default(0.0)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wallet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
end
