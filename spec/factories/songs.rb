FactoryGirl.define do
  factory :song do
    song_title "Rolling in the deep"
    song_writer "Adele Writer"
    album "Adele Album Name"
    stage_band_name "Adele Stage Name"
    release_date "" #Add appropriate value in appropriate format. Time.now?
    record_label "ADELE RECORD LABEL"
    album_cover Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_album_cover.jpg')))
    language 1
    primary_genre 2
    secondary_genre 3
    lyrics "Rolling in the Deep, Rolling in the Deep"
    audio_file Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_audio.mp3'))) 
    duration "" #Add appropriate value in appropriate format. Time.now?
    terms true

    factory :invalid_song do
      song_title ""
    end
  end

end
