# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  musician_id        :integer
#  total              :decimal(7, 2)    default(0.0)
#  payment_status     :boolean          default(FALSE)
#  shazam             :boolean          default(FALSE)
#  youtube            :boolean          default(FALSE)
#  store_maximizer    :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  transaction_log_id :integer
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:musician_id)}
  it { should belong_to(:musician).class_name('User') }
  it { should validate_numericality_of(:total) }

  it { should have_many(:order_items) }
end
