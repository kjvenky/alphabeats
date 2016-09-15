# == Schema Information
#
# Table name: shortlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Shortlist, type: :model do
  it {should belong_to(:song) }
  it {should belong_to(:user) }

  it { should validate_presence_of(:song_id) }
  it { should validate_presence_of(:user_id) }

end
