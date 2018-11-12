Feature: Shift Pattern
  As a store manager,
  in order to simplify my planning work,
  I would like to setup shifts with patterns that I can reuse

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |
    
    Given the following schedules are in the database
      | period               | 
      | 2018-11              | 
    
    And I am logged in as "user@example.com"

  Scenario: A user creates a shift pattern
    Given I visit the first planning period
    And I click on "add-pattern"
    And I fill in "Shift start" with "06:00:AM"
    And I fill in "shift-length" with "8"
    And I fill in "break-length" with "1"
    And I select "Selling" from "primary-role"
    And I click on "Create pattern"
    Then I should see "New shift pattern was successfully created"
   
