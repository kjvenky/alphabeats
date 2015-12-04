Feature: Upload songs
As an invited user I should be able to upload songs and view the songs page.

Scenario: Successful upload
  Given I am an invited user and I am logged in
	And I am on the song upload page
	When I add a song by filling all the fields in upload page
	Then I should be able to see the song page with all the details

Scenario: Successful edit
