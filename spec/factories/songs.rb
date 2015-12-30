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

FactoryGirl.define do
  factory :song do
    song_title "Rolling in the deep"
    song_writer "Adele Writer"
    album "Adele Album Name"
    stage_band_name "Adele Stage Name"
    release_date "" #Add appropriate value in appropriate format. Time.now?
    record_label "ADELE RECORD LABEL"
    album_cover {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_album_cover.jpg')))}
    language 1
    primary_genre 2
    secondary_genre 3
    lyrics "Rolling in the Deep, Rolling in the Deep"
    audio_file {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_audio.mp3')))} 
    duration "" #Add appropriate value in appropriate format. Time.now?
    terms true
    note_to_admin ""

    factory :invalid_song do
      song_title ""
    end

    factory :updated_song do
      song_title "UPDATED Rolling in the deep"
      song_writer "UPDATED Adele writer"
    end

    factory :song_with_notes do
      note_to_admin "please add my notes"
    end
  end

end
