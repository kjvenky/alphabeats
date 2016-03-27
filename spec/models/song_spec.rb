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

require 'rails_helper'

RSpec.describe Song, type: :model do
  it { should belong_to(:album) }
  it { should belong_to(:musician).class_name('User') }

  it { should validate_presence_of(:song_title) }
  it { should validate_presence_of(:terms) }
  it { should validate_presence_of(:audio_file)}
  it { should validate_presence_of(:album_id)}
  it { should validate_presence_of(:user_id)}
  it { should validate_presence_of(:original_artist)}
  it { should validate_presence_of(:original_song_title)}

  it { should validate_inclusion_of(:explicit_lyrics).in_array([true, false]) }
  it { should validate_inclusion_of(:self_written).in_array([true, false]) }


  
  #   it "is valid given valid attributes" do
  #     new_song = FactoryGirl.create(:song)
  #     expect(new_song).to be_valid
  #   end
  # end
  #
  # context "with nil attributes" do
  #   it "is invalid without a song title" do
  #     new_song = FactoryGirl.build(:song, song_title: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid without a song writer" do
  #     new_song = FactoryGirl.build(:song, song_writer: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #   it "is invalid without a stage/band name" do
  #     new_song = FactoryGirl.build(:song, stage_band_name: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid without a Release Date" do
  #     new_song = FactoryGirl.build(:song, release_date: nil)
  #     expect(new_song).to be_valid
  #   end
  #
  #   it "is valid without a Record Label" do
  #     new_song = FactoryGirl.build(:song, record_label: nil)
  #     expect(new_song).to be_valid
  #   end
  #
  #   it "is invalid without a Album cover" do
  #     new_song = FactoryGirl.build(:song, album_cover: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid without a Language" do
  #     new_song = FactoryGirl.build(:song, language: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid without a Primary Genre" do
  #     new_song = FactoryGirl.build(:song, primary_genre: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid without a Secondary Genre" do
  #     new_song = FactoryGirl.build(:song, secondary_genre: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid without a Lyrics" do
  #     new_song = FactoryGirl.build(:song, lyrics: nil)
  #     expect(new_song).to be_valid
  #   end
  #
  #   it "is invalid without a Audio File" do
  #     new_song = FactoryGirl.build(:song, audio_file: nil)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid without a Duration" do
  #     new_song = FactoryGirl.build(:song, duration: nil)
  #     expect(new_song).to be_valid
  #   end
  #
  #   it "is invalid without a terms of site check" do
  #     new_song = FactoryGirl.build(:song, terms: false)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid without a note to admin" do
  #     new_song = FactoryGirl.build(:song, note_to_admin: nil)
  #     expect(new_song).to be_valid
  #   end
  # end
  #
  # context "with different language and genre  attributes" do
  #
  #   it "is invalid if language value less than 1" do
  #     new_song = FactoryGirl.build(:song, language: 0)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid if language value greater than 40" do
  #     new_song = FactoryGirl.build(:song, language: 45)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid if language value is between 1 and 40" do
  #     new_song = FactoryGirl.build(:song, language: 35)
  #     expect(new_song).to be_valid
  #   end
  #
  #
  #   it "is invalid if primary genre value less than 0" do
  #     new_song = FactoryGirl.build(:song, language: -5)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid if primary genre value greater than 33" do
  #     new_song = FactoryGirl.build(:song, language: 45)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid if primary genre value is between 1 and 40" do
  #     new_song = FactoryGirl.build(:song, language: 23)
  #     expect(new_song).to be_valid
  #   end
  #
  #
  #   it "is invalid if secondary genre value less than 0" do
  #     new_song = FactoryGirl.build(:song, language: -5)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is invalid if secondary genre value greater than 33" do
  #     new_song = FactoryGirl.build(:song, language: 45)
  #     expect(new_song).to_not be_valid
  #   end
  #
  #   it "is valid if secondary genre value is between 1 and 40" do
  #     new_song = FactoryGirl.build(:song, language: 23)
  #     expect(new_song).to be_valid
  #   end
  # end
  #
end
