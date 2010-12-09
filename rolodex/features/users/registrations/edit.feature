Feature: Edit user password page
  Site should have a Edit user password page
  So that users can change their password

  Background:
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    Given I am on the edit user registration page

  Scenario: Going to back
    When I follow "Back"
    Then I should be on the home page

  Scenario: Update user information
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I fill in "user_current_password" with "123456"
    And I press "Update"
    Then I should see "You updated your account successfully."

  Scenario: Try to create new user without current user password
    When I fill in "user_email" with "test@test.com"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Update"
    Then I should see "Current password can't be blank"

  Scenario: Try to create new user with an email that already exist
    Given a user with email "sergio.aguirre2@live.com.mx" and password "123456"
    When I fill in "user_email" with "sergio.aguirre2@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I fill in "user_current_password" with "123456"
    And I press "Update"
    Then I should see "Email has already been taken"

  Scenario: Try to create new user without email
    When I fill in "user_email" with ""
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I fill in "user_current_password" with "123456"
    And I press "Update"
    Then I should see "Email can't be blank"

  Scenario: Try to create new user with diferent password and confirmation
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "1234567"
    And I fill in "user_current_password" with "123456"
    And I press "Update"
    Then I should see "Password doesn't match confirmation"

Scenario: Log out
    When I follow "log out"
    Then I should be on the home page
    And I should see "Signed out successfully."
