# OmniAuth.config.test_mode = true
# request.env["devise.mapping"] = Devise.mappings[:user] 
johnemail = 'john@lennon.com'
firstname="First"
lastname="Last"
email="first@last.com"
password="secret123"
fbemail="hbbpcqm_sharpeescu_1444030592@tfbnw.net"
fbpassword="secret123"

# World(Capybara::Email::DSL)
Given(/^I am on sign up page$/) do
  visit('/users/sign_up')
end

Given(/^I am on sign in page$/) do
  visit('/users/sign_in')
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
  sleep 2
  expect(page).to have_content("Log out")
end

Then(/^I should receive a confirmation mail$/) do
	open_email(johnemail)
	current_email.click_link("Confirm my account")
end


Given(/^I am an existing user and on login page$/) do
  usr = User.create(first_name: firstname, last_name: lastname, email: email, password: password, password_confirmation: password, confirmed_at: Time.now-2.days)
  usr.confirm!
end

When(/^I login by filling the fields$/) do
  visit('/users/sign_in')
  fill_in('Email', with: email )
  fill_in('Password', with: password)
  click_button('Log in')
end



Given(/^I signed up without confirming$/) do
  @usr = User.create(first_name: firstname, last_name: lastname, email: email, password: password, password_confirmation: password, confirmation_sent_at: Time.now-1.days, confirmed_at: nil )
  @usr.confirm!
  
end

Then(/^I login after two days$/) do
  click_link("Log out")
  @usr.update_attributes(confirmed_at: nil, confirmation_sent_at: Time.now - 3.days)
end

Then(/^I should not be able to login$/) do
  visit('/users/sign_in')
  fill_in('Email', with: email )
  fill_in('Password', with: password)
  click_button('Log in')
  expect(page).to have_content("You have to confirm your email address before continuing")
end




When(/^I sign up by filling facebook fields$/) do
  click_link("Sign in with Facebook")
  # byebug
  # sleep 2
  # fill_in('Email', with: fbemail )
  # fill_in('Password', with: fbpassword)
  # click_button('Log in')
  # byebug
  # sleep 5
  # click_button('Okay')o
  expect(page).to have_content("Home")
end

