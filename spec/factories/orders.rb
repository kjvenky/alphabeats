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

FactoryGirl.define do
  factory :order do
    musician nil
    total "9.99"
    payment_status false
    shazam false
    youtube false
    store_maximizer false
  end

end
