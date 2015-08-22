
class HomePage
  include PageObject

  def navigate_to_url(page_url)
    @browser.goto page_url
    return @browser.performance.summary[:response_time]/1000
  end

  def get_cookie(cookie_name)
    cookies = @browser.cookies[cookie_name.to_sym]
    return cookies[:value]
  end

  def get_response_time
    puts @broser.performance.summary[:response_time]/1000
    return @browser.performance.summary[:response_time]/1000
  end

end