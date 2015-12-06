Given(/^I am an invited user and I am logged in$/) do
  user_musician = FactoryGirl.create(:musician)
  # user_musician.musician = true
  visit new_user_session_path
  fill_in 'Email', with: 'ravik@codeastra.com'
  fill_in 'Password', with: 'secret123'
  click_button 'Log in'
end


And(/^I am on the song upload page$/) do
  # pending
  visit new_song_path
end

When(/^I add a song by filling all the fields in upload page$/) do
  pending
	# fill_in('Name Of The Song', with: 'Rolling in the Deep')
	# fill_in('Album', with: 'Adele First Album')
	# fill_in('Duration', with: '3:53')#Should be a drop down 
	# fill_in('Language', with: 'english' )
	# fill_in('Featured Artists', with: 'Enrique Iglesias')
	# fill_in('Genre', with: 'melody')
	# fill_in('Mood', with: 'joyful')
	# fill_in('Lyrics of the Song', with: "Imagine there's no heaven")
	# check "I accept the terms of the site"
	# click_button('Upload')
end


Then(/^I should be able to see the song page with all the details$/) do
  pending
  # expect(page).to have_content("Rolling in the Deep")
end
