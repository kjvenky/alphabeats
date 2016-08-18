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
  has_many :payments
  validates_presence_of :user_id


  def withdraw(money)
    if money < self.amount && money > 0
      new_money = self.amount - money
      self.update_attributes(amount: new_money)
    else
      puts "Not Enough Balance Or Improper Input"
    end
  end

end
