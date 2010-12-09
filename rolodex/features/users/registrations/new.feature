Feature: New User Registration page
  Site should have a User registration page
  So that users can Sign up

Background:
    Given I am on the new user registration page

Scenario: Going to Recovery password page
    When I follow "Forgot your password?"
    Then I should be on the new user password page

Scenario: Going to sign in page
    When I follow "Sign in"
    Then I should be on the new user session page

Scenario: Create new user
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."

Scenario: Try to create new user without data
    When I fill in "user_email" with ""
    And I fill in "user_password" with ""
    And I fill in "user_password_confirmation" with ""
    And I press "Sign up"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"


Scenario: Try to create new user without email
    When I fill in "user_email" with ""
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should see "Email can't be blank"

Scenario: Try to create new user without password
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with ""
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    And I should see "Password can't be blank"


Scenario: Try to create new user with diferent password and confirmation
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "1234567"
    And I press "Sign up"
    Then I should see "Password doesn't match confirmation"


Scenario: Try to create new user with an email that already exist
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should see "Email has already been taken"