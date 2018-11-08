Feature: User can log-in
    As a store manager,
    in order to leave the system for safety and other reasons,
    I would like to sign out from the system

    Background:
        Given the following user is registered
            | email             | password   | 
            | logout@user.com   | password   |     
        
        And I am logged in as "logout@user.com"

        Given the following schedules are in the database
            | period               | user                | 
            | 2018-01              | logout@user.com    | 

    Scenario: Logged in user successfully logout from setup schedule page
        Given I visit the schedule create page
        And I click on 'Log out'
        Then I am on landing page
        And I should see 'Signed out successfully.'

    Scenario: Logged in user successfully logout from schedule page
        Given I visit the schedule show page '2018-01'
        And I click on 'Log out'
        Then I am on landing page
        And I should see 'Signed out successfully.'