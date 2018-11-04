Feature: User creates account

    As a store manager,
    in order to gain access to the planning system,
    I would like to create an account.

    Scenario: Successfull registration as a new store manager
        Given I visit the landing page     
        And I click on the "Sign up" button
        Then I am on the Sign up page
        And I fill in "Email" with "email@email.com"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "password" 
        And I click on the "Sign up" button
        Then I am on the landing page 
        And I see the message "Welcome! You have signed up successfully."

    Scenario: User enters wrong password in password confirmation [Sad path]
        Given I am on the Sign up page
        And I fill in "Email" with "email@email.com"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "password"   
        And I click on the "Sign up" button
        And I see the message "Password confirmation doesn't match Password"