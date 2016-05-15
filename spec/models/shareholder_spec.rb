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

end
