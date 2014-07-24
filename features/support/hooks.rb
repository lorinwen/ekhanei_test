# encoding : utf-8

require 'watir-webdriver'
require 'watir-webdriver/wait'

Before do
  @browser = $browser

  Watir.default_timeout = 30
  PageObject.default_page_wait = 30

end

After do |scenario|

  puts 'INFO: Entering on After do |scenario|'

  if scenario.failed?
    write_warning('The scenario failed! :(')
  end
end

at_exit do
  $browser.quit
end