@search
Feature: This file contains all the scenarios for Search page

Scenario: User to search for specific item
Given I navigate to the url "http://www.swedishfurnitureparts.com"
When I search for "Cam Lock Nut #103114"
Then I am presented with exactly 1 result
