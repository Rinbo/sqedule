@javascript
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
      | name               | user             |
      | Rolf               | rolf@example.com |

    And I am logged in as "rolf@example.com"
    @javascript
    Scenario: A user can create, update and delete an assignment
      Given I visit the first planning period
      And I click on a new assignment      
      Then I am on assignment page
      And I choose "OFF" on "dropdown"
      And I click on "Assign"
      Then I should see "New assignment was successfully created"
      And I click on assignment edit link
      And I choose "VAC" on "dropdown"
      And I click on "Update"
      Then I should see "Assignment was successfully updated."
      Then wait
      And I click on "VAC"
      And I click on "Delete"
      Then I should see "Assignment was successfully deleted."
   