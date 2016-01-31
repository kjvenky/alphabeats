# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  musician_id     :integer
#  total           :decimal(, )      default(0.0)
#  payment_status  :boolean          default(FALSE)
#  shazam          :boolean          default(FALSE)
#  youtube         :boolean          default(FALSE)
#  store_maximizer :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  has_many :order_items

  validates_presence_of  :musician_id
  validates_numericality_of :total

end
