Feature: Shift Pattern
  As a store manager,
  in order to simplify my planning work,
  I would like to setup shifts with patterns that I can reuse

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |     
    
    And I am logged in as "user@example.com"
    
  Scenario: A user creates a shift pattern
    Given I visit planning period number "1"
    And I fill in "Start Time" with "06:00"
    And I fill in "Length" with "8"
    And I fill in "Break" with "1"
    And I click checkbox "Cleaning"
    Then I should see "New shift pattern was successfully created"
   
