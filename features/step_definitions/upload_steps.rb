Given(/^I am an invited user and I am logged in$/) do
  user_musician = FactoryGirl.create(:musician)
  # user_musician.musician = true
  visit new_user_session_path
  fill_in 'Email', with: 'ravik@codeastra.com'
  fill_in 'Password', with: 'secret123'
  click_button 'Log in'
end


And(/^I am on the song upload page$/) do
  visit new_song_path
end

When(/^I add a song by filling all the fields in upload page$/) do
  pending
	# fill_in('Song title', with: 'Rolling in the Deep')
	# fill_in('Songwriter', with: 'Adele Writer')
	# fill_in('Album', with: 'Adele Album Name')
	# fill_in('Stage/band Name', with: 'Adele Stage Name')
	# fill_in('Release Date', with: '23 December 2015')#Should be a drop down 
	# fill_in('Record Label', with: 'ADELE RECORD LABEL')
	# fill_in('Album Cover', with: 'cover.png')
	# fill_in('Language', with: 'english')
	# fill_in('Primary Genre', with: 'pop')
	# fill_in('Secondary Genre', with: 'rock')
	# fill_in('Do you have lyrics?', with: 'yes')
	# fill_in('Lyrics', with: 'Rolling in the deep, Rolling in the deep')
	# fill_in('Audio File', with: 'audio/audio')
	# fill_in('Duration', with: '3:53')
	# check "I accept the terms of the site"
	# click_button('Upload')
end


Then(/^I should be able to see the song page with all the details$/) do
  pending
  # expect(page).to have_content("Rolling in the Deep")
end
