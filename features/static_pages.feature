Feature: Static Pages of the website
	As a user
	In order to learn about the music application
	I want to access different pages in the website

Scenario Outline: Interlinking between pages
	Given I am on Home Page
	When I click on <word>
	Then I should go to <page>

	Examples:
		| word | page |
		| "About us" | About Page |
		



