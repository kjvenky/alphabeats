# == Schema Information
#
# Table name: shortlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :shortlist do
    user_id 1
song_id 1
  end

end
