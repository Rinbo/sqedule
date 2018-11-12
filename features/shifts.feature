Feature: Dated Shifts
  As a store manager,
  in order to assign the no of people and competencies needed for a given day,
  I would like an interactive object per combination of day and shift pattern to be able to fill in my needs

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |
    
    Given the following schedules are in the database
      | period               |
      | 2018-11              |
    Given the following patterns are in the database
      | shift_start        | user             | 
      | 06:00              | user@example.com | 

    And I am logged in as "user@example.com"
    Given I visit the first planning period 

    @javascript
    Scenario: A user can create a default shift by just clicking the plus button on a shift and then edit it           
      And I click on a new shift      
      Then I should see "New shift was successfully created"
      And I click on "1"
      And I fill in "Staff req" with "3"
      And I click on "Update"
      Then I should see "Shift was successfully updated."
      
