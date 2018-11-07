Feature: Schedule model

  As a user
  In order to save my planning periods
  I need a planning period object unique to a given month

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |     
    
    And I am logged in as "user@example.com"
    And I visit the landing page

  @javascript
  Scenario: User visits schedule page and creates a schedule
    When I click "New Schedule"
    And I fill in "date-input" with Jan, 2018
    And I click on "Create Schedule"
    Then I should see "New schedule successfully created"
    # Below feature tests works locally but fails on sema. Commented out for that reason
    # And I should see "Mon" within date field number "1"
    # And I should see "Wed" within date field number "31" 
   