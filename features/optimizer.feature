@javascript @webhook
Feature: Optimizer send feature
  As a store manager
  In order to get a schedule for a given planning period
  I would like an optimizer button

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
    Given the following shifts are in the database
      | date               | pattern          |
      | 2018-11-01         | 06:00            |
    Given the following staff are in the database
      | name               | user             |
      | Rolf               | user@example.com |
    Given the following assignments are in the database
      | date               | staff            |
      | 2018-11-01         | Rolf             |
    And I am logged in as "user@example.com"
    And I visit the first planning period
  

  Scenario: A user hits Optimeize and gets displayed a summary of that period
    When I click on "Review"
    Then I should see "Summary of planning period"

  Scenario: A user clicks optimize and receives a response
    When I click on "Review"
    And I click on "Optimize"
    Then I wait "3" seconds
    Then a post request should have been made to "https://ca-endpoints.herokuapp.com/api/optimizers"
    Then I should see "Response received without any updates"
    
    


   