# encoding : utf-8

class PreviewFormPage

  include PageObject

  #
  # ACCESSORS SECTION
  #

  text_field(:email_confirmation,     id:'email_confirm')
  text_field(:password,               id:'passwd')
  text_field(:password_confirmation,  id:'passwd_ver')

  checkbox(:create_an_account,           xpath:'.//*[@class=\'mypages-ai-wrap\']//input[@name=\'create_account\']')
  button(:postad,                     id:'ai-mypages-button')

  #
  # METHODS SECTION
  #

  def fill_form(type,text)
    element = type.downcase.gsub(' ', '_')
    text_field = self.send("#{element}_element")
    text_field.when_present
    self.send("#{element}=",text)
    puts 'INFO: Set to '+element+' the text: '+text
  end

  def check_page
    raise 'ERROR: This is not Team page' unless title.start_with?("Preview ad")
    puts 'INFO: You are in Team page'
  end


  def confirm_click
    wait_until{self.postad?}
    self.postad
  end

  def check_create_account
    wait_until{self.create_an_account?}
    if self.create_an_account_checked?
      self.uncheck_create_an_account
    end
  end

end