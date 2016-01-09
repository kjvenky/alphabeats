# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  album_name      :string
#  musician_id     :integer
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

require 'rails_helper'

RSpec.describe Album, type: :model do
  it { should validate_presence_of(:album_name)}
  it { should validate_presence_of(:musician_id)}
  it { should validate_presence_of(:stage_band_name)}
  it { should validate_presence_of(:album_cover)}
  it { should validate_presence_of(:language)}
  it { should validate_presence_of(:primary_genre)}


  it { should validate_numericality_of(:musician_id)}
  it { should validate_numericality_of(:language)}
  it { should validate_numericality_of(:primary_genre)}
  it { should validate_numericality_of(:secondary_genre)}

  it { should validate_inclusion_of(:language).in_range(1..40) }
  it { should validate_inclusion_of(:primary_genre).in_range(0..33)}
  it { should validate_inclusion_of(:secondary_genre).in_range(0..33)}


  it { should belong_to(:musician).class_name('User') }
  it { should have_many(:songs) }
end
