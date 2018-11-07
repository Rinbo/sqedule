Feature: Shift Pattern
  As a store manager,
  in order to assign the no of people and competencies needed for a given day,
  I would like an interactive object per combination of day and shift pattern to be able to fill in my needs

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |
    
    Given the following schedules are in the database
      | period               | user                | 
      | 2018-01              | user@example.com    | 

    And I am logged in as "user@example.com"

    Scenario: A user creates a shift pattern and dated shifts objects are genereted automatically
      Given I visit the latest planning period
      And I fill in "Shift start" with "06:00:AM"
      And I fill in "Shift length" with "8"
      And I fill in "Break length" with "1"
      And I click checkbox "cleaning"
      And I click on the "Create pattern" button
      Then I should see "New shift pattern and shift objects were successfully created"
     