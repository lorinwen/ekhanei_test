# encoding : utf-8

class HomePage

  include PageObject

  page_url 'https://www.ekhanei.com/en'

  #
  # ACCESSORS SECTION
  #


  link(:btnad, id:'bt_post_your_ad')


  #
  # METHODS SECTION
  #

  def check_page
    wait_until{self.btnad?}
    puts 'INFO: We are in Home page'
  end

  def add_ad_insertion_click
    wait_until{self.btnad?}
    self.btnad
  end

end