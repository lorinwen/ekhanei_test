# encoding : utf-8

class FormPage

  include PageObject

  #
  # ACCESSORS SECTION
  #


  select_list(:category,  id:'category_group')
  select_list(:region,    id:'region')
  select_list(:location,  id:'area')
  text_field(:title,      id:'subject')
  text_area(:ad_text,      id:'body')
  text_field(:price,      id:'price')
  button(:btnimageupload,      id:'imageupload')
  text_field(:name,       id:'name')
  text_field(:email,      id:'email')
  text_field(:phone,      id:'phone')
  button(:btncontinue,    id:'validate')
  span(:error_message,    class:'msg_error nohistory')
  # is better to use an ID or class btw
  span(:create_your_ad,   xpath:'.//*[@id=\'wrapper\']//span[text()=\'Create your ad\']')
  span(:error_location,   text:'Select a city')

  #
  # METHODS SECTION
  #

  def fill_select_form(type,option)
    element = type.downcase.gsub(' ', '_')
    select = self.send("#{element}_element")
    select.when_present
    select.select_value(option)
  end

  def fill_form(type,text)
    element = type.downcase.gsub(' ', '_')
    text_field = self.send("#{element}_element")
    text_field.when_present
    self.send("#{element}=",text)
    puts 'INFO: Set to '+element+' the text: '+text
  end

  def check_error_form(type)
    element = type.downcase.gsub(' ', '_')
    text_field = self.send("error_#{element}_element")
    text_field.when_visible(30)
    puts 'INFO: Error in '+type+' detected'
  end

  def check_page
    wait_until{self.create_your_ad?}
    puts 'INFO: We are in Form page'
  end

  def confirm_click
    wait_until{self.btncontinue?}
    self.btncontinue
  end

  def click_image
    wait_until{self.btnimageupload?}
    self.btnimageupload
  end

  def upload_image(img_name)
    sleep 3

    image_path = File.expand_path(File.join(File.dirname(__FILE__), "../../../../files/uploads/#{img_name}"))
    puts_debug "DEBUG: the image path is: <#{image_path}>."
    self.btn_upload = image_path
    puts_debug 'INFO: image uploaded.'
  end

end