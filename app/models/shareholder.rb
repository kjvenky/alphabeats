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

  validates_presence_of :song_id, :user_id, :share
  validates_numericality_of :song_id, :user_id, only_integer: true
  validates_numericality_of :share, greater_than_or_equal_to: 0, less_than_or_equal_to: 100



end
