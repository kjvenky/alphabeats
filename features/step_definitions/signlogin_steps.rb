johnemail = 'john@lennon.com'
# World(Capybara::Email::DSL)
Given(/^I am on sign up page$/) do
  visit('/users/sign_up')
end

When(/^I sign up by filling the fields$/) do
  fill_in('First name', with: 'John')
  fill_in('Last name', with: 'Lennon')
  fill_in('Email', with: johnemail )
  fill_in('Password', with: 'secret123')
  fill_in('Password confirmation', with: 'secret123')
  click_button('Sign up')
end

Then(/^I should be logged in$/) do
  expect(page.current_path).to have_content("/")
  #Later| Should be changed to discover.
end

Then(/^I should receive a confirmation mail$/) do
	open_email(johnemail)
	#debugger
	current_email.click_link("Confirm my account")
end

