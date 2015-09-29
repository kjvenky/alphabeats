Feature: Signup and Login
	In order to access internal pages
	As a visitor and user
	I want to be able to sign up and login respectively

	The value addition of this feature is in being able to retain customers and create additional features which need persistent user data(wallet, playlist).
	
	# @javascript
	Scenario: Signing up
		Given I am on sign up page
		When I sign up by filling the fields
		Then I should be logged in 
		And I should receive a confirmation mail
	
	# Scenario: Successful Login
	# 	Given I am a user of the website who confirmed email
	# 	When I login by filling the fields
	# 	Then I should be logged in

	# Scenario: Unsuccessful Login
	# 	Given I am not a user of the website
	# 	When I login by filling the fields
	# 	Then I should see an error message

	# Scenario: Unconfirmed sign up works only until 2 days and fails later
	# 	Given I signed up
	# 	When I don't confirm email
	# 	Then I should be logged in
	# 	But after two days I should not be able to login

	# Scenario: Facebook Sign up
	# 	Given I am on sign up page
	# 	When I sign up by filling facebook fields
	# 	Then I should be logged in
	# 	#Later(?)| When I don't confirm email
	# 	#Later(?)| Then I should not be able to login

	# Scenario: Bad sign up
	# #Later| validate first name, last name, password, email
	# Scenario: Facebook Sign up and resetting through normal signup

	#Later| change login redirected page

