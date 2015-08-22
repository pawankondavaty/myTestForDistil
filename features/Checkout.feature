@checkout
Feature: This file holds all the scenarios for Checkout page

Scenario: User adds product to checkout and proceeds to checkout
Given I navigate to the url "http://www.swedishfurnitureparts.com/products/ikea-cam-lock-nut-103114"
When I add the product to the cart
And I update the quantity to "2"
And I click Checkout
Then I am on the Checkout customer information page

