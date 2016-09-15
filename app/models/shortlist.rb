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

class Shortlist < ActiveRecord::Base
  
  belongs_to :song
  belongs_to :user

end
