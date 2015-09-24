Given(/^I am on Home Page$/) do
  visit('/')
end

When(/^I click on "(.*?)"$/) do |linktext|
	click_link(linktext)
end

Then(/^I should go to About Page$/) do
  visit('/about')
end
