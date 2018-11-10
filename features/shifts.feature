Feature: Shift Pattern
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
   
    Scenario: A user creates a shift pattern and dated shifts objects are genereted automatically
      Given I visit the first planning period      
      And I click on a new shift
      And I fill in "staff-requirement" with "1"
      And I click on "Save Shift"      
      Then I should see "New shift was successfully created"
     