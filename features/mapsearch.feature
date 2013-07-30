Feature: Map search on the dashboard page (user logged in) and the home page (user not logged in)

  There should be proper error handling and correct flash alerts for invalid zip_codes and zip_codes that yield no search results.

@javascript
  Scenario: Unregistered user searches using a valid zip_code on the dashboard page.
    Given I am on the dashboard page
    When I enter in a valid zip_code
    Then I should be redirected to the map page, and not see any errors

  # Scenario: A merchant account holder is signed in and goes to the home page.
  #   Given I am logged in as a merchant user
  #   Then I should see the merchant account user dashboard when I visit the homepage

