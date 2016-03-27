# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  album_name      :string
#  user_id         :integer
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

FactoryGirl.define do
  factory :album do
    album_name "MyString"
    stage_band_name "Ravi Stage band"
    release_date ""
    record_label "Alphabeats Music"
    album_cover {Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_album_cover.jpg')))}
    language 1
    primary_genre 2
    secondary_genre 3
    association :musician, factory: :musician

    factory :invalid_album do
      primary_genre ""
    end

    factory :updated_album do
      album_name "Updated MyString"
      stage_band_name "UPDATED Ravi STage band"
    end
  end

end
