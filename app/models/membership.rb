class Membership < ActiveRecord::Base

  belongs_to :user
  has_one :subscription_item, as: :itemable, dependent: :destroy

  enum renewal_status: [:expired, :active]
end
