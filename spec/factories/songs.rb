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
#  user_id             :integer
#  explicit_lyrics     :boolean
#  self_written        :boolean
#  original_artist     :string
#  original_song_title :string
#  spotify             :string
#  itunes              :string
#  apple_music         :string
#  google_play         :string
#  amazon              :string
#  r_dio               :string
#  deezer              :string
#  tidal               :string
#  youtube             :string
#  microsoft_groove    :string
#  media_net           :string
#

FactoryGirl.define do
  factory :song do
    song_title "Rolling in the deep"
    lyrics "Rolling in the Deep, Rolling in the Deep"
    audio_file {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_audio.mp3')))} 
    duration "" #Add appropriate value in appropriate format. Time.now?
    terms true
    note_to_admin ""
    association :album, factory: :album
    self_written true
    original_artist "NA"
    original_song_title "NA"
    explicit_lyrics true
    before(:create) do |song|
      song.musician = song.album.musician
      song.save
    end

    factory :invalid_song do
      song_title ""
    end

    factory :updated_song do
      song_title "UPDATED Rolling in the deep"
    end

    factory :song_with_notes do
      note_to_admin "please add my notes"
    end
  end

end
