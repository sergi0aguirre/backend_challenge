Feature: Recovery password page
  Site should have a New User passsword page
  So that users can Recovery their password

Background:
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I am on the new user password page

Scenario: Going to Sign in page
    When I follow "Sign in"
    Then I should be on the new user session page


Scenario: Going to sign up page
    When I follow "Sign up"
    Then I should be on the new user registration page


Scenario: Sending the new password
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I press "Send me reset password instructions"
    Then I should see "You will receive an email with instructions about how to reset your password in a few minutes."

Scenario: Sending the new password without and account
    When I fill in "user_email" with "sergio.aguirre2@live.com.mx"
    And I press "Send me reset password instructions"
    Then I should see "Email not found"
