# == Schema Information
#
# Table name: songs
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  song_title      :string
#  song_writer     :string
#  album           :string
#  stage_band_name :string
#  record_label    :string
#  language        :integer
#  primary_genre   :integer
#  secondary_genre :integer
#  lyrics          :text
#  terms           :boolean
#  release_date    :date
#  audio_file      :string
#  album_cover     :string
#  duration        :time
#

class Song < ActiveRecord::Base
  validates :song_title, presence: true
  validates :song_writer, presence: true
  validates :album, presence: true
  validates :stage_band_name, presence: true
  # validates :record_label, absence: true
  validates :language, presence: true
  validates :primary_genre, presence: true
  validates :secondary_genre, presence: true
  # validates :lyrics, absence: true
  validates :terms, presence: true
  # validates :release_date, absence: true
  mount_uploader :audio_file, AudioFileUploader
  validates :audio_file, presence: true
  mount_uploader :album_cover, AlbumCoverUploader
  validates :album_cover, presence: true
  # validates :duration, absence: true
end
