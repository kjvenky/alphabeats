require 'rails_helper'

RSpec.describe Album, type: :model do
  it { should validate_presence_of(:album_name)}
  it { should validate_presence_of(:musician_id)}
  it { should validate_numericality_of(:musician_id)}
  it { should belong_to(:musician).class_name('User') }
end
