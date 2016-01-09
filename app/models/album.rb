# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  album_name      :string
#  musician_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stage_band_name :string
#  release_date    :date
#  record_label    :string
#  album_cover     :string
#  language        :integer
#  primary_genre   :integer
#  secondary_genre :integer
#

class Album < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  has_many :songs
  validates_presence_of :album_name, :musician_id, :stage_band_name, :album_cover, :language, :primary_genre
  validates_numericality_of :musician_id, :language, :primary_genre, :secondary_genre
end
