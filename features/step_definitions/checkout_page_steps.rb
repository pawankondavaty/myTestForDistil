
When /^I add the product to the cart$/ do
  on CheckoutPage do |page|
    page.add_to_cart_element.click
  end
end

When /^I update the quantity to "(.*)"$/ do |quantity|
  on CheckoutPage do |page|
    page.item_qty = quantity
  end
end

When /^I click Checkout$/ do
  on CheckoutPage do |page|
    page.checkout_cart
  end
end

Then /^I am on the Checkout customer information page$/ do
  expect(@browser.title.to_s).to eq("Swedish Furniture Parts - Checkout")
end