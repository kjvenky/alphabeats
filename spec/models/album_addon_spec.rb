# == Schema Information
#
# Table name: album_addons
#
#  id                      :integer          not null, primary key
#  album_id                :integer
#  youtube                 :boolean
#  shazam                  :boolean
#  store_maximizer         :boolean
#  renewal_status          :integer
#  start_date              :date
#  next_renewal_date       :date
#  number_of_times_renewed :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe AlbumAddon, type: :model do

  it {is_expected.to belong_to(:album) }

  it do
    should define_enum_for(:renewal_status).
      with([:expired, :active])
  end

end
