# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
# musician = User.create! :first_name => 'Ravi', :last_name => 'Kanth',  :email => 'ravikanth1988@gmail.com', :password => 'ravikanth', :password_confirmation => 'ravikanth'
#
# Album.destroy_all
# album = Album.create! :album_name => 'Album one', :musician_id => 1, :stage_band_name => 'Ravi Band Name', :record_label => 'Ravi Label', :album_cover => "{Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/testfiles/sample_album_cover.jpg')))}", :language => 1,  :primary_genre => 2, :secondary_genre => 3
    
3.times do |n|
  musician_name  = "musician_#{n+1}"
  musician_email = "musician_#{n+1}@helloravi.com"
  password = "secret123"
  musician = User.create!(first_name:  musician_name,
              last_name: "Last Name",
               email: musician_email,
               password: password,
               password_confirmation: password,
                         confirmed_at: Time.now)
  Wallet.create!(user_id: musician.id, amount: 1000)

  puts "created musician_#{n+1} and its wallet"

  music_fan_name  = "music_fan_#{n+1}"
  music_fan_email = "music_fan_#{n+1}@helloravi.com"
  password = "secret123"
  music_fan = User.create!(first_name:  music_fan_name,
              last_name: "Last Name",
               email: music_fan_email,
               password: password,
               password_confirmation: password,
                         confirmed_at: Time.now)
  Wallet.create!(user_id: music_fan.id, amount: 1000)
  puts "created musicfan_#{n+1} and its wallet"

end

puts "Created three musicians and three musicFANs"
    
#     
# 3.times do |n|
#   musician_email = "musician_#{n+1}@helloravi.com"
#   user = User.find_by(email: musician_email)
#
#   3.times do |m|
#     user.albums.create(album_name:"Musician_#{n+1}_Album_#{m+1}", stage_band_name:"M_#{n+1}_A_#{m+1}", release_date:, record_label:"Label_M_#{n+1}_A_#{m+1}", album_cover:, language:"#{n+1+m+1}", primary_genre:"#{n+1+m+1}", secondary_genre:"#{n+1+m+4}")
#     user.albums.create(album_name:"Musician_#{n+1}_Single_#{m+1}", stage_band_name:"M_#{n+1}_S_#{m+1}", release_date:, record_label:"Label_M_#{n+1}_S_#{m+1}", album_cover:, language:"#{n+1+m+1}", primary_genre:"#{n+1+m+1}", secondary_genre:"#{n+1+m+4}")
#   end
#
# end
#
# puts "Created 9 albums and 9 singles, (3 albums and 3 singles) for each of the three  musician"
