Feature: Landing page
  As a store owner,
  in order to find out info about sqedule and to get working,
  I would like a landing page

  Scenario: User enters page and gets information about the site and options
    Given I visit the landing page
    Then I should see "Sqedule"
    And I should see "Sign up"
    And I should see "Copyright"