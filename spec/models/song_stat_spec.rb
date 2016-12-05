# == Schema Information
#
# Table name: song_stats
#
#  id                            :integer          not null, primary key
#  reporting_date                :date
#  sale_month                    :string
#  store                         :string
#  artist                        :string
#  title                         :string
#  quantity                      :integer
#  song_album                    :string
#  customer_paid                 :decimal(7, 2)
#  customer_currency             :string
#  country_of_sale               :string
#  songwriter_royalties_withheld :string
#  earnings                      :decimal(7, 2)
#  song_id                       :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'rails_helper'

RSpec.describe SongStat, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
