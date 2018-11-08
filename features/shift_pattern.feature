Feature: Shift Pattern
  As a store manager,
  in order to simplify my planning work,
  I would like to setup shifts with patterns that I can reuse

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |
    
    Given the following schedules are in the database
      | period               | user                | 
      | 2018-01              | user@example.com    |   
    
    And I am logged in as "user@example.com"

  Scenario: A user creates a shift pattern
    Given I visit the latest planning period
    And I fill in "Shift start" with "06:00:AM"
    And I fill in "Shift length" with "8"
    And I fill in "Break length" with "1"
    And I click checkbox "cleaning"
    And I click on "Create pattern"
    Then I should see "New shift pattern was successfully created"
   
