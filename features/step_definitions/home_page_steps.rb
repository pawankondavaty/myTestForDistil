Given /^I navigate to the url "(.*)"$/ do |page_url|
  on HomePage do |page|
    @url = page_url
    @response_time = page.navigate_to_url(page_url)
  end
end

Then /^I verify for the cookie (.*)$/ do |cookie_name|
  on HomePage do |page|
    expect(page.get_cookie(cookie_name)).to_not be_nil

  end
end

Then /^I verify page headers to ensure page is not cached$/ do
  on HomePage do |page|
   uri = URI(@url)
   response = Net::HTTP.get_response(uri)
    puts response['Cache-Control']
    expect(response['Cache-Control']).to be(nil)
  end
end

Then /^I veify the page load time is less than (.*)ms$/ do |time|
  on HomePage do |page|
    puts @response_time
    expect(@response_time).to be < time.to_i
  end
end