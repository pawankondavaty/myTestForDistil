require 'watir-webdriver'
require 'rubygems'
require 'selenium-webdriver'

include UtilityMethods
include HarParser

#######################
# Dual Browser Support
#####

#Passed from Rake and Profile in cuke.yml

# Cucumber hooks
Before do |scenario|

 # proxy_listener = BrowserMob::Proxy::WebDriverListener.new(proxy)

	#@browser = Watir::Browser.new :chrome#, :profile => profile, :listener =>



	profile = Selenium::WebDriver::Firefox::Profile.new
	add_har_to_browser(profile)


	@browser = Watir::Browser.new :chrome#, :profile => profile

	@browser.driver.manage.window.maximize



	# Set scenario names
	case scenario
		when Cucumber::Ast::OutlineTable::ExampleRow
			@scenario_name = scenario.scenario_outline.name
		when Cucumber::Ast::Scenario
			@scenario_name = scenario.name
		else
			raise("Unhandled Class")
	end
end

# Screenshots on failures
After do |scenario|
	Dir::mkdir('artifacts/screenshots') if not File.directory?('artifacts/screenshots')
	screenshot = "./artifacts/screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
	if scenario.failed?
		@browser.driver.save_screenshot(screenshot)
		embed(screenshot, "image/png", "SCREENSHOT")
  end


  sleep 3 #toget har

	@browser.quit



  #proxy_listener.hars #=> [#<HAR::Archive:0x-27066c42d7e75fa6>, #<HAR::Archive:0x-d7e75fa627066c42>]
  #proxy.close
end





at_exit do
	if ENV['GETHAR'] == "True"
		ENV['BROWSER'] = "" # Emptying the Browser Argument
		view_har_file
	end
end

