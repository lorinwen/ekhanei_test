
# encoding : utf-8

class ThankYouPage

  include PageObject

  #
  # ACCESSORS SECTION
  #

  h2(:your_ad_is_almost_published,     id:'ad_verify_heading')

  #
  # METHODS SECTION
  #

  def check_page
    wait_until{self.your_ad_is_almost_published?}
    puts 'INFO: We are in Thank You page'
  end

end