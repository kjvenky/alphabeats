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

class Shareholder < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

end
