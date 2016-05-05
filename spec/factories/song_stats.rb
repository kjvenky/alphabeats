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

FactoryGirl.define do
  factory :song_stat do
    reporting_date "2016-04-26"
sale_month "MyString"
store "MyString"
artist "MyString"
title "MyString"
quantity 1
song_album "MyString"
customer_paid "9.99"
customer_currency "MyString"
country_of_sale "MyString"
songwriter_royalties_withheld "MyString"
earnings "9.99"
song_id 1
  end

end
