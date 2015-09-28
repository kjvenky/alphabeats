Feature: Signup and Login
	In order to access internal pages
	As a visitor and user
	I want to be able to sign up and login respectively

	The value addition of this feature is in being able to retain customers and create additional features which need persistent user data(wallet, playlist).

	Scenario: Signing up
	Given I am on sign up page
	When I sign up by filling the fields
	Then I should receive a confirmation mail
	And I should be logged in

	Scenario: Unconfirmed sign up
	Scenario: Bad sign up
	Scenario: Successful Login
	Scenario: Unsuccessful Login
