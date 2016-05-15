# == Schema Information
#
# Table name: shareholders
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  user_id    :integer
#  share      :decimal(8, 5)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Shareholder, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should belong_to(:user) }
  it { should belong_to(:song) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:song_id) }
  it { should validate_presence_of(:share) }

  it { should validate_numericality_of(:user_id).only_integer }
  it { should validate_numericality_of(:song_id).only_integer }

  it { should validate_numericality_of(:share).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }

end
