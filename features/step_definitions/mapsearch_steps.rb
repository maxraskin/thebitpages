Given(/^I am on the dashboard page$/) do
  visit('/')
end

When(/^I enter in a valid zip_code$/) do
  fill_in "category", :with => ""
  fill_in "zip_code", :with => "10001"

  click_button "Search"
end


Then(/^I should be redirected to the map page, and not see any errors$/) do
  expect(page).not_to have_content("Invalid Zip Code.")
  expect(page).not_to have_content("No matches found.")
  #fix test database (migrate from development)
end