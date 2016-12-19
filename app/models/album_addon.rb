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

class AlbumAddon < ActiveRecord::Base

  belongs_to :album
  has_one :subscription_item, as: :itemable, dependent: :destroy

  enum renewal_status: [:expired, :active]
end
