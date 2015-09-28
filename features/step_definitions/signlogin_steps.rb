Given(/^I am on sign up page$/) do
  visit('/users/sign_up')
end

When(/^I sign up by filling the fields$/) do
  fill_in('First Name', with: 'John')
  fill_in('Last Name', with: 'Lennon')
  fill_in('Email', with: 'john@lennon.com')
  fill_in('Password', with: 'secret123')
  click_link('#signup')
end

Then(/^I should be logged in$/) do
  expect(page).to have_content("Discover")
end

# Then(/^I should receive a confirmation mail$/) do
#   pending # express the regexp above with the code you wish you had
# end

