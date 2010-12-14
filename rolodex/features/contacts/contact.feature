Feature: Contacts Page
  Site should have a Contacts page
  So that users can manage their contacts

  Background:
    Given a user with email "sergio.aguirre@live.com.mx" and password "123456"
    Given I sign in with "sergio.aguirre@live.com.mx/123456" credentials
    Given I have the following contacts created by "sergio.aguirre@live.com.mx":
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
    Given I am on the contacts page

  @javascript
  Scenario: See the links atcontacts
    Then I should see "Order Z-A"
    And I should see "Select all"
    And I should see "Select none"
    And I should see "Delete selected contacts"
    And I should see "Expor all to Vcards"

  @javascript
  Scenario: Create new contact
    When I follow "Add new contact"
    Then I should see "Create new contact"
    And I fill in "contact_first_name" with "rudolf"
    And I fill in "contact_middle_name" with "jonas"
    And I fill in "contact_last_name" with "vorak"
    And I fill in "contact_company_name" with "My own company"
    And I press "Save"
    Then I should see "Successfully created contact."

  @javascript
  Scenario: Create new contact without name
    When I follow "Add new contact"
    Then I should see "Create new contact"
    And I fill in "contact_first_name" with ""
    And I fill in "contact_middle_name" with "jonas"
    And I fill in "contact_last_name" with "vorak"
    And I fill in "contact_company_name" with "My own company"
    And I press "Save"
    Then I should see "1 error prohibited this contact from being saved"
    And I should see "First name can't be blank"

  @javascript
  Scenario: Show  contact Details
    When I follow "sergio1 Tobias aguirre1"
    Then I should see "Edit"
    And I should see "Export as Vcard"
    And I should see "Delete"
    And I should see "[x] Close"

  @javascript
  Scenario: Show  contact Details with address
    Given the contact with name "sergio1" created by "sergio.aguirre@live.com.mx" has the following addresses:
      | address  | city  | zip   | state  | country |
      | street 1 | city1 | 12345 | state1 | country |
      | street 2 | city2 | 14345 | state2 | country |
      | street 3 | city3 | 11345 | state3 | country |
    When I follow "sergio1 Tobias aguirre1"
    Then I should see "street 1"
    And I should see "city3"
    And I should see "11345"
    And I should see "country"

  @javascript
  Scenario: Show  contact Details with phones
    Given the contact with name "sergio1" created by "sergio.aguirre@live.com.mx" has the following phones:
      | area_code | number  |
      | 312       | 1234567 |
      | 332       | 7654321 |
      | 330       | 1234567 |
    When I follow "sergio1 Tobias aguirre1"
    Then I should see "123-4567"
    And I should see "(330)"
    And I should see "(332)"
    And I should see "765-4321"

  @javascript
  Scenario: Edit contact Details
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "Edit"
    Then I should see "Edit contact"
    And I fill in "contact_first_name" with "rudolf"
    And I fill in "contact_middle_name" with "jonas"
    And I fill in "contact_last_name" with "vorak"
    And I fill in "contact_company_name" with "My own company"
    And I press "Update"
    Then I should see "Successfully updated contact."

  @javascript
  Scenario: Edit contact Details without name
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "Edit"
    Then I should see "Edit contact"
    And I fill in "contact_first_name" with ""
    And I fill in "contact_middle_name" with "jonas"
    And I fill in "contact_last_name" with "vorak"
    And I fill in "contact_company_name" with ""
    And I press "Update"
    Then I should see "1 error prohibited this contact from being saved"
    And I should see "First name can't be blank"

  @javascript
  Scenario: Edit contact Details and press cancel
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "Edit"
    Then I should see "Edit contact"
    And I press "Cancel"
    Then I should see "Contact Details"
    And I should see "Export as Vcard"

  @javascript
  Scenario: The contacts should be paginated
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio1"
    And I should see "sergio17"
    And I should not see "sergio5"
    When I follow "2"
    Then I should see "sergio6"
    And I should see "sergio5"
    When I follow "1"
    And I should see "sergio1"
    And I should see "sergio17"

  @javascript
  Scenario: The contactacts should be Sorted  Z-A
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio1"
    And I should see "sergio17"
    And I should not see "sergio5"
    When I follow "Order Z-A"
    Then I should see "sergio8"
    And I should see "sergio5"
    And I should not see "sergio1"
    And I should not see "sergio17"

  @javascript
  Scenario: The contactacts should be Sorted  A-Z
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio1"
    And I should see "sergio17"
    And I should not see "sergio5"
    When I follow "Order Z-A"
    Then I should see "sergio8"
    And I should see "sergio5"
    And I should not see "sergio1"
    And I should not see "sergio17"
    When I follow "Order A-Z"
    And I should see "sergio1"
    And I should see "sergio17"

  @javascript
  Scenario: Search by name
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio1"
    And I should see "sergio17"
    And I should not see "sergio5"
    When I fill in "key" with "11"
    Then I should see "sergio11"
    And I should see "aguirre11"
    And I should not see "sergio17"
    When I follow "Clear"
    Then I should see "sergio1"

  @javascript
  Scenario: Search by company name
    And I should see "Previous"
    And I should see "Next"
    And I should see "sergio1"
    And I should see "sergio17"
    And I should not see "sergio5"
    When I fill in "key" with "int"
    Then I should see "sergio8"
    And I should see "sergio21"
    When I follow "Clear"
    Then I should see "sergio1"

  @javascript
  Scenario: Delete a contact
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "|Delete"
    Given a confirmation box saying "Are you sure?" should pop up
    When I confirm a js popup on the next step
    Then I should see "Successfully destroyed contact."

  @javascript
  Scenario: Delete all selected contact
    And I should see "sergio0"
    And I should see "sergio17"
    When I follow "selectall"
    Then I follow "deletecontacts"
    Given a confirmation box saying "Are you sure?" should pop up
    When I confirm a js popup on the next step
    And I should not see "sergio0"
    And I should not see "sergio17"
    And I should see "sergio5"
    And I should see "sergio8"
