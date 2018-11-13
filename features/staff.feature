Feature: Staff view
  As a store manager
  In order to manage my staff
  I would like a way to create staff entries and assign attributes to them

  Background:
    Given the following user is registered
      | email               | password   | 
      | user@example.com    | password   |
    Given the following schedules are in the database
      | period               | 
      | 2018-11              | 
    And I am logged in as "user@example.com"

  @javascript
  Scenario: A user can add staff members in schedule view
    Given I visit the first planning period
    And I click on "add-staff"
    And I fill in "Name" with "Rolf Lassgård"
    And I click on "Add"
    Then I should see "New staff member was successfully created"
    And I should see "Rolf Lassgård"

   
 