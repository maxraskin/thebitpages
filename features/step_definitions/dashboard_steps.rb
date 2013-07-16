Given(/^I am logged in as an individual user$/) do
  visit('/users/sign_up')

  name = "individual1"
  email = "individual1@email.com"
  password = "password"
  password_confirmation = "password"

  fill_in "user_name", :with => name
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => password_confirmation

  click_button "Create Account"
end

Then(/^I should see the individual account user dashboard when I visit the homepage$/) do
  visit('/')
  expect(page).to have_content("individual dashboard")
end


Given(/^I am logged in as a merchant user$/) do
  visit('/merchants/sign_up')

  name = "merchant1"
  email = "merchant1@email.com"
  password = "password"
  password_confirmation = "password"

  fill_in "merchant_name", :with => name
  fill_in "merchant_email", :with => email
  fill_in "merchant_password", :with => password
  fill_in "merchant_password_confirmation", :with => password_confirmation

  click_button "Create Account"
end

Then(/^I should see the merchant account user dashboard when I visit the homepage$/) do
  visit('/')
  expect(page).to have_content("merchant dashboard")
end