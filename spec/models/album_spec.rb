# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  album_name  :string
#  musician_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Album, type: :model do
  it { should validate_presence_of(:album_name)}
  it { should validate_presence_of(:musician_id)}
  it { should validate_numericality_of(:musician_id)}
  it { should belong_to(:musician).class_name('User') }
  it { should have_many(:songs) }
end
