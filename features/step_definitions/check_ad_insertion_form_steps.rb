And (/^I am on the (.*) page$/) do |page_name|
  case page_name
    when 'Home'
      visit_page HomePage
      on_page(HomePage).check_page
    when 'Preview Form'
      on_page(PreviewFormPage).check_page
    else no_option_defined_for page_name
  end
end

And (/^I click on Post your free ad link$/) do
  on_page(HomePage).add_ad_insertion_click
end

And (/^I am in the insertion form$/) do
  on_page(FormPage).check_page
end

And (/^I should see the error (.*) text$/) do |type_error|
  on_page(FormPage).check_error_form type_error
end

And (/^I fill the (.*) field$/) do |type_field|

  case type_field
    when 'category'
      on_page(FormPage).fill_select_form(type_field,'7010') # Category: other
    when 'region'
      on_page(FormPage).fill_select_form(type_field,'1') #region: Dhaka City
    when 'location'
      on_page(FormPage).fill_select_form(type_field,'21') #location: Shyampur
    when 'title'
      on_page(FormPage).fill_form(type_field,'Test title of Jordi')
    when 'ad text'
      on_page(FormPage).fill_form(type_field,'This is a text description for Jordi test, i will fill all the gaps')
    when 'price'
      on_page(FormPage).fill_form(type_field,'25')
    when 'image'
      on_page(FormPage).click_image
      on_page(FormPage).upload_image('trust.jpg')
    when 'name'
      on_page(FormPage).fill_form(type_field,'Jordi')
    when 'email'
      on_page(FormPage).fill_form(type_field,'jordi@test.com')
    when 'phone'
      on_page(FormPage).fill_form(type_field,'01711525200')
    when 'email confirmation'
      on_page(PreviewFormPage).fill_form(type_field,'jordi@test.com')
    when 'password'
      on_page(PreviewFormPage).fill_form(type_field,'1q1q1q1q')
    when 'password confirmation'
      on_page(PreviewFormPage).fill_form(type_field,'1q1q1q1q')
    else no_option_defined_for type_field
  end
end

And (/^I click on (.*) button$/) do |button_name|
  case button_name
    when 'confirm'
      on_page(FormPage).confirm_click
    when 'confirm preview'
      on_page(PreviewFormPage).confirm_click
    else no_option_defined_for type_field
  end
end


Then(/^I should see the Thank you page$/) do
  on_page(ThankYouPage).check_page
end

Then (/^I don't want to create an account$/) do
  on_page(PreviewFormPage).check_create_account
end