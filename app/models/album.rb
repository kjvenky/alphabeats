class Album < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  validates_presence_of :album_name
  validates_presence_of :musician_id
  validates_numericality_of :musician_id
end
