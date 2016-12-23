# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  total              :decimal(7, 2)    default(0.0)
#  payment_status     :boolean          default(FALSE)
#  shazam             :boolean          default(FALSE)
#  youtube            :boolean          default(FALSE)
#  store_maximizer    :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  transaction_log_id :integer
#

class Subscription < ActiveRecord::Base
  belongs_to :musician, class_name: User.name, foreign_key: 'user_id'
  has_many :subscription_items
  # belongs_to :transaction_log
  has_one :transaction_log, as: :transactable, dependent: :destroy

  validates_presence_of  :user_id
  validates_numericality_of :total

  enum subscription_type: [:membership, :albumaddon]

  def copy_addon_values
    if subscription_type == 'albumaddon'
      self.subscription_items.each do |s|
        s.itemable.update_attributes!(youtube: self.youtube, shazam: self.shazam, store_maximizer: self.store_maximizer, renewal_status: "active", start_date: Date.today, next_renewal_date: 1.year.since)
      end
    end
  end

end
