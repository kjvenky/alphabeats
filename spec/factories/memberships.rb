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

FactoryGirl.define do
  factory :membership do
    user_id 1
    renewal_status 1
    start_date "2016-12-17"
    next_renewal_date "2016-12-17"
    number_of_times_renewed 1
  end
end
