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
  validates :audio_file, presence: true
  validates :album_cover, presence: true
  # validates :duration, absence: true
end