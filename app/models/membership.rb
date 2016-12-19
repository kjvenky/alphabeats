# == Schema Information
#
# Table name: memberships
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  renewal_status          :integer
#  start_date              :date
#  next_renewal_date       :date
#  number_of_times_renewed :integer          default(0)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Membership < ActiveRecord::Base

  belongs_to :user
  has_one :subscription_item, as: :itemable, dependent: :destroy

  enum renewal_status: [:expired, :active]
end
