Feature: Assignment
  As a store manager
  In order to manage staff assignments
  I want an assignment module to customize the schedule

  Background:
     Given the following user is registered
      | email               | password   | 
      | rolf@example.com    | password   |

    Given the following schedules are in the database
      | period               | 
      | 2018-11              | 
    
    Given the following staff are in the database
      | name               |
      | Rolf               |

    And I am logged in as "user@example.com"

    Scenario: A user can create an assignment
      Given I visit the first planning period
      And I click on a new assignment      
      Then I am on assignment page
      And I click checkbox "staff-off"
      And I click on "Create"
      Then I should see "New assignment was successfully created"