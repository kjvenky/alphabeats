# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  song_id     :integer
#  open_status :integer
#  share       :decimal(8, 5)
#  amount      :decimal(7, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Offer < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

end
