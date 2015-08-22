@home
Feature: This contains all the scenarios for the home page

Scenario: Navigate to Sweedish furniture website and verify cookie, cache and page load time
Given I navigate to the url "http://www.swedishfurnitureparts.com/"
Then I verify for the cookie _shopify_s
And I verify page headers to ensure page is not cached
And I veify the page load time is less than 500ms