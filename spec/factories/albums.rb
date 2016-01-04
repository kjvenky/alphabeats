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

FactoryGirl.define do
  factory :album do
    album_name "MyString"
    musician nil
  end

end
