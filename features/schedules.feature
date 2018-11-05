Feature: Schedule model

  As a user
  In order to save my planning periods
  I need a planning period object unique to a given month

  # Background:
  #   Given the following user is registered
  #     | email           | password   | 
  #     | sad@path.com    | password   |     
    
  #   And I am logged in as "sad@path.com"
  #   And I visit the landing page

  Background:
    Given the following user is registered
        | email         | password   | 
        | hej@path.com  | password   |        

    Given I visit the landing page
    And I click on the 'Login' button
    Then I am on the Log in page
    And I fill in 'Email' with 'hej@path.com'
    And I fill in 'Password' with 'password'
    And I click on the 'Log in' button
    Then I should see 'Signed in successfully.'

  Scenario: User visits schedule page and creates a schedule
    When I click "New Schedule"
    And I fill in "Period" with "01-2018"
    And I click on the "Create Schedule" button
    Then I should see "New schedule successfully created"
   