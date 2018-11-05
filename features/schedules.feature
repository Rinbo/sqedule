Feature: Schedule model

  As a user
  In order to save my planning periods
  I need a planning period object unique to a given month

  Scenario: User visits schedule page and creates a schedule
    Given I visit the main schedule page
    And I click "Create new Schedule"
    And I fill in "01-2018" in the "period" field
    Then I should see "New schedule successfully created"
   