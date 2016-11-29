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
  musician.wallet.update!(amount: 1000)

  puts "created musician_#{n+1} and its wallet"

  music_fan_name  = "music_fan_#{n+1}"
  music_fan_email = "music_fan_#{n+1}@helloravi.com"
  password = "secret123"
  music_fan = User.create!(first_name:  music_fan_name,
              last_name: "Last Name",
               email: music_fan_email,
               password: password,
               password_confirmation: password,
               musician: false,
                         confirmed_at: Time.now)
  music_fan.wallet.update!(amount: 1000)
  
  puts "created musicfan_#{n+1} and its wallet"

end

puts "Created three musicians and three musicFANs"
    
    
3.times do |n|
  musician_email = "musician_#{n+1}@helloravi.com"
  user = User.find_by(email: musician_email)

  3.times do |m|
    user.albums.create(album_name:"Musician_#{n+1}_Album_#{m+1}", stage_band_name:"M_#{n+1}_A_#{m+1}",  record_label:"Label_M_#{n+1}_A_#{m+1}", album_cover:File.open(Rails.root + "app/assets/images/album.jpg"), language:"#{n+1+m+1}", primary_genre:"#{n+1+m+1}", secondary_genre:"#{n+1+m+4}")
    user.albums.create(album_name:"Musician_#{n+1}_Single_#{m+1}", stage_band_name:"M_#{n+1}_S_#{m+1}", record_label:"Label_M_#{n+1}_S_#{m+1}", album_cover:File.open(Rails.root + "app/assets/images/single.jpg"), language:"#{n+1+m+1}", primary_genre:"#{n+1+m+1}", secondary_genre:"#{n+1+m+4}")
  end

end

puts "Created 9 albums and 9 singles, (3 albums and 3 singles) for each of the three  musician"

3.times do |n|
  musician_email = "musician_#{n+1}@helloravi.com"
  user = User.find_by(email: musician_email)

  3.times do |m|
    single = user.albums.find_by(stage_band_name:"M_#{n+1}_S_#{m+1}")
    single.songs.create!(song_title:"Musician_#{n+1}_Single_#{m+1}_Song", lyrics:"Musician_#{n+1}_Single_#{m+1}_Lyrics", terms: true, audio_file: File.open(Rails.root + "public/muted_one_sec.mp3"), explicit_lyrics: true, self_written: true, user_id: user.id)
    puts "Created a song for Musician_#{n+1}_Single_#{m+1}_Song"
    album = user.albums.find_by(stage_band_name:"M_#{n+1}_A_#{m+1}")
    3.times do |o|
    album.songs.create!(song_title:"Musician_#{n+1}_Album_#{m+1}_Song_#{o+1}", lyrics:"Musician_#{n+1}_Album_#{m+1}_Lyrics_#{o+1}", terms: true, audio_file: File.open(Rails.root + "public/muted_one_sec.mp3"), explicit_lyrics: true, self_written: true, user_id: user.id)
    puts "Created a song for Musician_#{n+1}_Album_#{m+1}_Song_#{o+1}"
    end
    # single.songs.create(song_title:"Musician_#{n+1}_Single_#{m+1}_Song", song_writer:, lyrics:"Musician_#{n+1}_Single_#{m+1}_Lyrics", terms:, audio_file:,  duration:, note_to_admin:, album_id:, explicit_lyrics:, self_written:, original_artist:, original_song_title:)
  end

end

puts "Created 36 songs: 12 for each user - 3 for 3 albums an 1 for each of 3 singles"
