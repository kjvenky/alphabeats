# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  album_name  :string
#  musician_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  validates_presence_of :album_name
  validates_presence_of :musician_id
  validates_numericality_of :musician_id
end
