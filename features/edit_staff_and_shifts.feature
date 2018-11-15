@javascript
Feature: Edit staff and shifts
  As a store manager,
  in order to modify staff and shifts after creation,
  I would like an edit functionality

  Background:
    Given the following user is registered
      | email            | password |
      | user@example.com | password |
    Given the following schedules are in the database
      | period  |
      | 2018-11 |
    Given the following patterns are in the database
      | shift_start | user             |
      | 06:00       | user@example.com |
    Given the following shifts are in the database
      | date       | pattern |
      | 2018-11-01 | 06:00   |
    Given the following staff are in the database
      | name   | user             |
      | Rolf   | user@example.com |
      | Magnus | user@example.com |
    And I am logged in as "user@example.com"
    And I visit the first planning period

  Scenario: A user can edit staff members in schedule view
    Given I visit the first planning period
    And I click "Edit staff" for "Rolf"
    When I fill in "Name" with "Oliver"
    And I fill in "Shift preference" with "3"
    And I fill in "staff_employment_end" with formatted time
    And I select "Manager" from "primary-role"
    And I click on "Update Staff"
    Then I should see "Staff member was successfully edited"

  Scenario: A user enters already used name when editing staff [Sad Path]
    Given I visit the first planning period
    And I click "Edit staff" for "Rolf"
    When I fill in "Name" with "Magnus"
    And I fill in "Shift preference" with "3"
    And I fill in "staff_employment_end" with formatted time
    And I select "Manager" from "primary-role"
    And I click on "Update Staff"
    Then I should see "has already been taken"