# encoding : utf-8
# encoding : utf-8

require 'page-object'
require 'cucumber'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'rubygems'
require 'page-object/page_factory'
require 'require_all'


# Made accessible to all the application the PageObject::PageFactory module
World (PageObject::PageFactory)

## SETTING FIREFOX LAUNCHING ##
puts 'INFO: Using Firefox browser.'
$profile = Selenium::WebDriver::Firefox::Profile.new
$profile.assume_untrusted_certificate_issuer = false
$profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 90 # seconds – default is 60
$browser = Watir::Browser.new :firefox , profile: $profile, :http_client => client