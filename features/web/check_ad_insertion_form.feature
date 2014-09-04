Feature: Ad insertion without account and no image uploading

  Background: Go to Post your free ad and fill common fields
    Given I am on the Home page
    And I click on Post your free ad link
    And I am in the insertion form
    When I fill the category field
    And I fill the region field
    And I fill the title field
    And I fill the ad text field
    And I fill the price field
    And I fill the image field
    And I fill the name field
    And I fill the email field
    And I fill the phone field

  Scenario: Incorrect ad insertion
  As an ekhanei user
  to check the validation  of ad insertion form
  I expect to see an error in the ad insertion form the validation of the form

      And I click on confirm button
    Then I should see the error Location text

  Scenario: Correct ad insertion
  As an ekhanei user
  to add an ad insertion
  I expect to see the preview page after the validation of the form

      And I fill the location field
      And I click on confirm button
    Then I am on the Preview Form page

  Scenario: Confirm preview page
  As an ekhanei user
  to add an ad insertion
  I expect to see the thank you screen after confirm the preview page

      And I fill the location field
      And I click on confirm button
    Then I am on the Preview Form page
      And I fill the email confirmation field
      And I fill the password field
      And I fill the password confirmation field
      And I don't want to create an account
      And I click on confirm preview button
    Then I should see the Thank you page