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
        Then I end up on the landing page 
        And I should see "Welcome! You have signed up successfully."

    Scenario: User enters wrong password in password confirmation [Sad path]
        Given I am on the Sign up page
        And I fill in "Email" with "email@email.com"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "notpassword"   
        And I click on the "Sign up" button
        And I should see "Password confirmation doesn't match Password"
        