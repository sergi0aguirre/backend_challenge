Feature: New User Session page
  Site should have a New User Session page
  So that users can Sign in

Background:
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I am on the new user session page

Scenario: Going to Recovery password page
    When I follow "Forgot your password?"
    Then I should be on the new user password page

Scenario: Going to sign in page
    When I follow "Sign in"
    Then I should be on the new user session page

Scenario: Create new session
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should be on the home page

Scenario: Try Create new session without  data
    When I fill in "user_email" with ""
    And I fill in "user_password" with ""
    And I press "Sign in"
    Then I should be on the new user session page


Scenario: Try Create new session without  email
    When I fill in "user_email" with ""
    And I fill in "user_password" with "123456"
    And I press "Sign in"
    Then I should be on the new user session page

Scenario: Try Create new session without  password
    When I fill in "user_email" with "sergio.aguirre@live.com.mx"
    And I fill in "user_password" with ""
    And I press "Sign in"
    Then I should be on the new user session page