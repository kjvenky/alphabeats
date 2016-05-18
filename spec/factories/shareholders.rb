# == Schema Information
#
# Table name: shareholders
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  user_id    :integer
#  share      :decimal(8, 5)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :shareholder do
    song_id 1
    user_id 1
    share "9.99"
  end

end
