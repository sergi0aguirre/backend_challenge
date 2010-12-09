Feature: Site home page
  Site should have a home page
  So that users can vist the site

Background:
    Given I go to the home page

Scenario: Welcome page
    I should see "Rolodex Contacts Management"
    And I should see "Wellcome to Rolodex"
    And I should see "Sign in"
    And I should see "Sign up"

Scenario: Welcome page with session
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    And I should see "sergio.aguirre@live.com.mx (edit)"

Scenario: Go to edit user page
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    And I follow "sergio.aguirre@live.com.mx (edit)"
    Then I should be on the edit user registration page

Scenario: Going to Sign in page
    When I follow "Sign in"
    Then I should be on the new user session page


Scenario: Going to sign up page
    When I follow "Sign up"
    Then I should be on the new user registration page

Scenario: Log out
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    When I follow "log out"
    Then I should be on the home page
    And I should see "Signed out successfully."