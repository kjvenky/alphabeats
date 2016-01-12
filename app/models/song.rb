# == Schema Information
#
# Table name: songs
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  song_title    :string
#  song_writer   :string
#  lyrics        :text
#  terms         :boolean
#  audio_file    :string
#  duration      :time
#  note_to_admin :text
#  album_id      :integer
#  musician_id   :integer
#

class Song < ActiveRecord::Base

  belongs_to :musician, class_name: User.name
  belongs_to :album


  validates_presence_of :song_title, :song_writer, :terms, :audio_file, :album_id, :musician_id

  validates :terms, acceptance: {accept: true}

  mount_uploader :audio_file, AudioFileUploader

end
