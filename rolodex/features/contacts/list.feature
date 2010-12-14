Feature: Contacts Page  List functionality
  Site should have a Contacts page
  So that users can manage their contacts

  Background:
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    Given I have the following list created by "sergio.aguirre@live.com.mx":
      | name   |
      | list5  |
      | list6  |
      | list7  |
      | list8  |
      | list9  |
      | list10 |
    Given I am on the contacts page

  @javascript
  Scenario: I should se  al my list
    Then I should see "list5"
    And I should see "list6"
    And I should see "list7"
    And I should see "list8"
    And I should see "list9"
    And I should see "list10"

  @javascript
  Scenario: Create new List
    When I follow "Add new list"
    Then I should see "Create new list"
    And I fill in "list_name" with "My new list"
    And I press "Save"
    Then I should see "My new list - [X]"

  @javascript
  Scenario: Create new contact without name
    When I follow "Add new list"
    Then I should see "Create new list"
    And I fill in "list_name" with ""
    And I press "Save"
    Then I should see "1 error prohibited this list from being saved"
    And I should see "Name can't be blank"

  @javascript @aqui
  Scenario: Show contacts in an especific list
    Given the list with name "list5" created by "sergio.aguirre@live.com.mx" has the following contacts:
      | first_name | middle_name | last_name | company |
      | sergio1    | Tobias      | aguirre1  | cardex  |
      | sergio2    | Tobias      | aguirre2  | cr      |
      | sergio3    | Tobias      | aguirre3  | food    |
      | sergio4    | Tobias      | aguirre4  | sam     |
      | sergio5    | Tobias      | aguirre5  | hp      |
      | sergio6    | Tobias      | aguirre6  | ghl     |
      | sergio7    | Tobias      | aguirre7  | cardex  |
      | sergio8    | Tobias      | aguirre8  | inta    |
      | sergio9    | Tobias      | aguirre8  | cardex  |
      | sergio0    | Tobias      | aguirre9  | cardex  |
      | sergio11   | Tobias      | aguirre10 | cardex  |
      | sergio12   | Tobias      | aguirre11 | cardex  |
      | sergio13   | Tobias      | aguirre12 | cardex  |
      | sergio14   | Tobias      | aguirre12 | cardex  |
      | sergio15   | Tobias      | aguirre1  | cardex  |
      | sergio16   | Tobias      | aguirre1  | cardex  |
      | sergio17   | Tobias      | aguirre1  | cardex  |
      | sergio18   | Tobias      | aguirre1  | phil    |
      | sergio19   | Tobias      | aguirre1  | ips     |
      | sergio20   | Tobias      | aguirre1  | cardex  |
      | sergio21   | Tobias      | aguirre1  | intel   |
    When I follow "Click here show the contacts in this list - list5"
    Then I should see "sergio0"
    And I should not see "list7"
    And I should not see "list8"
    And I should not see "list9"
    And I should not see "list10"
    Then I follow "<< Back"
    And I should see "list7"
    And I should see "list8"
    And I should see "list9"
    And I should see "list10"

@javascript @aqui
  Scenario: The contacts should be Sorted  A-Z
    Given the list with name "list5" created by "sergio.aguirre@live.com.mx" has the following contacts:
      | first_name | middle_name | last_name | company |
      | sergio1    | Tobias      | aguirre1  | cardex  |
      | sergio2    | Tobias      | aguirre2  | cr      |
      | sergio3    | Tobias      | aguirre3  | food    |
      | sergio4    | Tobias      | aguirre4  | sam     |
      | sergio5    | Tobias      | aguirre5  | hp      |
      | sergio6    | Tobias      | aguirre6  | ghl     |
      | sergio7    | Tobias      | aguirre7  | cardex  |
      | sergio8    | Tobias      | aguirre8  | inta    |
      | sergio9    | Tobias      | aguirre8  | cardex  |
      | sergio0    | Tobias      | aguirre9  | cardex  |
      | sergio11   | Tobias      | aguirre10 | cardex  |
      | sergio12   | Tobias      | aguirre11 | cardex  |
      | sergio13   | Tobias      | aguirre12 | cardex  |
      | sergio14   | Tobias      | aguirre12 | cardex  |
      | sergio15   | Tobias      | aguirre1  | cardex  |
      | sergio16   | Tobias      | aguirre1  | cardex  |
      | sergio17   | Tobias      | aguirre1  | cardex  |
      | sergio18   | Tobias      | aguirre1  | phil    |
      | sergio19   | Tobias      | aguirre1  | ips     |
      | sergio20   | Tobias      | aguirre1  | cardex  |
      | sergio21   | Tobias      | aguirre1  | intel   |
    When I follow "Click here show the contacts in this list - list5"
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio0"
    And I should see "sergio15"
    When I follow "orderlink_gen"
    Then I should see "sergio8"
    And I should see "sergio5"
    

  @javascript
  Scenario: Search by name
     Given the list with name "list5" created by "sergio.aguirre@live.com.mx" has the following contacts:
      | first_name | middle_name | last_name | company |
      | sergio1    | Tobias      | aguirre1  | cardex  |
      | sergio2    | Tobias      | aguirre2  | cr      |
      | sergio3    | Tobias      | aguirre3  | food    |
      | sergio4    | Tobias      | aguirre4  | sam     |
      | sergio5    | Tobias      | aguirre5  | hp      |
      | sergio6    | Tobias      | aguirre6  | ghl     |
      | sergio7    | Tobias      | aguirre7  | cardex  |
      | sergio8    | Tobias      | aguirre8  | inta    |
      | sergio9    | Tobias      | aguirre8  | cardex  |
      | sergio0    | Tobias      | aguirre9  | cardex  |
      | sergio11   | Tobias      | aguirre10 | cardex  |
      | sergio12   | Tobias      | aguirre11 | cardex  |
      | sergio13   | Tobias      | aguirre12 | cardex  |
      | sergio14   | Tobias      | aguirre12 | cardex  |
      | sergio15   | Tobias      | aguirre1  | cardex  |
      | sergio16   | Tobias      | aguirre1  | cardex  |
      | sergio17   | Tobias      | aguirre1  | cardex  |
      | sergio18   | Tobias      | aguirre1  | phil    |
      | sergio19   | Tobias      | aguirre1  | ips     |
      | sergio20   | Tobias      | aguirre1  | cardex  |
      | sergio21   | Tobias      | aguirre1  | intel   |
    When I follow "Click here show the contacts in this list - list5"
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio0"
    And I should see "sergio17"
    When I fill in "key_gen" with "11"
    Then I should see "sergio11"
    And I should see "aguirre11"
    When I follow "clear_search_gen"
    Then I should see "sergio0"



     @javascript @aqui
  Scenario: Search by company name
    Given the list with name "list5" created by "sergio.aguirre@live.com.mx" has the following contacts:
      | first_name | middle_name | last_name | company |
      | sergio1    | Tobias      | aguirre1  | cardex  |
      | sergio2    | Tobias      | aguirre2  | cr      |
      | sergio3    | Tobias      | aguirre3  | food    |
      | sergio4    | Tobias      | aguirre4  | sam     |
      | sergio5    | Tobias      | aguirre5  | hp      |
      | sergio6    | Tobias      | aguirre6  | ghl     |
      | sergio7    | Tobias      | aguirre7  | cardex  |
      | sergio8    | Tobias      | aguirre8  | inta    |
      | sergio9    | Tobias      | aguirre8  | cardex  |
      | sergio0    | Tobias      | aguirre9  | cardex  |
      | sergio11   | Tobias      | aguirre10 | cardex  |
      | sergio12   | Tobias      | aguirre11 | cardex  |
      | sergio13   | Tobias      | aguirre12 | cardex  |
      | sergio14   | Tobias      | aguirre12 | cardex  |
      | sergio15   | Tobias      | aguirre1  | cardex  |
      | sergio16   | Tobias      | aguirre1  | cardex  |
      | sergio17   | Tobias      | aguirre1  | cardex  |
      | sergio18   | Tobias      | aguirre1  | phil    |
      | sergio19   | Tobias      | aguirre1  | ips     |
      | sergio20   | Tobias      | aguirre1  | cardex  |
      | sergio21   | Tobias      | aguirre1  | intel   |
    When I follow "Click here show the contacts in this list - list5"
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio0"
    And I should see "sergio17"
    When I fill in "key_gen" with "int"
    Then I should see "sergio8"
    And I should see "sergio21"
    When I follow "clear_search_gen"
    Then I should see "sergio0"

    @javascript 
  Scenario: Delete a list
    Then I follow "delete_list5"
    Given a confirmation box saying "Are you sure?" should pop up
    When I confirm a js popup on the next step
    And I should not see "list5"