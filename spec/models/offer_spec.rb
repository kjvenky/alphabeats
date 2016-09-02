# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  song_id     :integer
#  open_status :integer
#  share       :decimal(8, 5)
#  amount      :decimal(7, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  offer_price :decimal(7, 2)
#

require 'rails_helper'

RSpec.describe Offer, type: :model do

  it { should belong_to (:user) }
  it { should belong_to (:song) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:song_id) }
  it { should validate_presence_of(:open_status) }
  it { should validate_presence_of(:share) }
  it { should validate_presence_of(:amount) }


  it { should validate_numericality_of(:user_id).only_integer }
  it { should validate_numericality_of(:song_id).only_integer }
  it { should validate_numericality_of(:open_status).only_integer }

  it { should validate_numericality_of(:share).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
  it { should validate_numericality_of(:amount) }
  it { should validate_numericality_of(:offer_price) }

end


