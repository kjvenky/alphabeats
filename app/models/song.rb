# == Schema Information
#
# Table name: songs
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  song_title          :string
#  lyrics              :text
#  terms               :boolean
#  audio_file          :string
#  duration            :time
#  note_to_admin       :text
#  album_id            :integer
#  musician_id         :integer
#  explicit_lyrics     :boolean
#  self_written        :boolean
#  original_artist     :string
#  original_song_title :string
#

class Song < ActiveRecord::Base

  belongs_to :musician, class_name: User.name
  belongs_to :album


  validates_presence_of :song_title,  :terms, :audio_file, :album_id, :musician_id,  :original_artist, :original_song_title

  validates :terms, acceptance: {accept: true}
  validates_inclusion_of :explicit_lyrics, :in => [true, false]
  validates_inclusion_of :self_written, :in => [true, false]

  mount_uploader :audio_file, AudioFileUploader


end
