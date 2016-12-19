# == Schema Information
#
# Table name: album_addons
#
#  id                      :integer          not null, primary key
#  album_id                :integer
#  youtube                 :boolean
#  shazam                  :boolean
#  store_maximizer         :boolean
#  renewal_status          :integer
#  start_date              :date
#  next_renewal_date       :date
#  number_of_times_renewed :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

FactoryGirl.define do
  factory :album_addon do
    album_id 1
    youtube false
    shazam false
    store_maximizer false
    renewal_status 1
    start_date "2016-12-18"
    next_renewal_date "2016-12-18"
    number_of_times_renewed 1
  end
end
