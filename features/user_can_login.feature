Feature: User can log-in
    As a visitor,
    In order to gain access to my account,
    I would like to login.

    Background:
        Given the following user is registered
            | email         | password   | 
            | sad@path.com  | password   |
        
        Given the following schedules are in the database
        | period               | 
        | 2018-11              |

    Scenario: Registered user successfully login
        Given I visit the landing page
        And I click on 'Login'
        Then I am on the Log in page
        And I fill in 'Email' with 'sad@path.com'
        And I fill in 'Password' with 'password'
        And I click on 'Log in'
        And I should see 'Signed in successfully.'

    Scenario: 'User inputs invalid password [Sad path]'
        Given I visit the landing page
        And I click on 'Login'
        Then I am on the Log in page
        And I fill in 'Email' with 'sad@path.com'
        And I fill in 'Password' with 'drowssap'
        And I click on 'Log in'
        Then I should see 'Invalid Email or password.'