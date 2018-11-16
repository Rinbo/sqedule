Feature: Shift Pattern
  As a store manager,
  in order to simplify my planning work,
  I would like to setup shifts with patterns that I can reuse

  Background:
    Given the following user is registered
      | email            | password |
      | user@example.com | password |

    Given the following schedules are in the database
      | period  |
      | 2018-11 |

    And I am logged in as "user@example.com"

  @javascript
  Scenario: A user creates a shift pattern
    Given I visit the first planning period
    And I click on "add-pattern"
    And I fill in "shift-start" with formatted time
    And I fill in "shift-end" with formatted time
    And I fill in "break-length" with formatted time
    And I select "Manager" from "primary-role"
    And I click on "Create Pattern"
    Then I should see "New shift pattern was successfully created"
    And I click "Edit shift" for "13:01"
    And I click on "Delete shift"
    Then I should see "Shift pattern was successfully deleted."

