require 'rails_helper'

RSpec.describe Song, type: :model do
  # pending
  it "is valid given valid attributes" do
    new_song = FactoryGirl.create(:song)
    expect(new_song).to be_valid
  end

  it "is invalid without a song title" do
    new_song = FactoryGirl.build(:song, song_title: nil)
    expect(new_song).to_not be_valid
  end

  it "is invalid without a song writer" do
    new_song = FactoryGirl.build(:song, song_writer: nil)
    expect(new_song).to_not be_valid
  end
  it "is invalid without a stage/band name" do
    new_song = FactoryGirl.build(:song, stage_band_name: nil)
    expect(new_song).to_not be_valid
  end

  it "is valid without a Release Date" do
    new_song = FactoryGirl.build(:song, release_date: nil)
    expect(new_song).to be_valid
  end

  it "is valid without a Record Label" do
    new_song = FactoryGirl.build(:song, record_label: nil)
    expect(new_song).to be_valid
  end

  it "is invalid without a Album cover" do
    new_song = FactoryGirl.build(:song, album_cover: nil)
    expect(new_song).to_not be_valid
  end

  it "is invalid without a Language" do
    new_song = FactoryGirl.build(:song, language: nil)
    expect(new_song).to_not be_valid
  end

  it "is invalid without a Primary Genre" do
    new_song = FactoryGirl.build(:song, primary_genre: nil)
    expect(new_song).to_not be_valid
  end

  it "is invalid without a Secondary Genre" do
    new_song = FactoryGirl.build(:song, secondary_genre: nil)
    expect(new_song).to_not be_valid
  end

  it "is valid without a Lyrics" do
    new_song = FactoryGirl.build(:song, lyrics: nil)
    expect(new_song).to be_valid
  end

  it "is invalid without a Audio File" do
    new_song = FactoryGirl.build(:song, audio_file: nil)
    expect(new_song).to_not be_valid
  end

  it "is valid without a Duration" do
    new_song = FactoryGirl.build(:song, duration: nil)
    expect(new_song).to be_valid
  end

  it "is invalid without a terms of site check" do
    new_song = FactoryGirl.build(:song, terms: false)
    expect(new_song).to_not be_valid
  end

end
