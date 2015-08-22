When /^I search for "(.*)"$/ do |text|
  on SearchPage do |page|
    page.search_text(text)
  end
end

Then /^I am presented with exactly (.*) result$/ do |count|
  on SearchPage do |page|
    expect(page.get_results).to be(count.to_i)
  end
end