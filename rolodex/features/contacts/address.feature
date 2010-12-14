Feature: Contacts Page  Address Section
  Site should have a Contacts page
  So that users can manage their contacts and  add addessess

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
    Given the contact with name "sergio1" created by "sergio.aguirre@live.com.mx" has the following addresses:
      | address  | city  | zip   | state  | country |
      | street 1 | city1 | 12345 | state1 | country |
      | street 2 | city2 | 14345 | state2 | country |
      | street 3 | city3 | 11345 | state3 | country |
    Given I am on the contacts page
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "Edit"


  @javascript 
  Scenario: Create new address
    And I follow "Add new address"
    And I fill in "address_address" with "street 233"
    And I fill in "address_zip" with "11111"
    And I fill in "address_city" with "CAR"
    And I fill in "address_state" with "DC"
    And I fill in "address_country" with "USA"
    And I select "home" from "address_address_type_id"
    And I press "Save"
    Then I should see "street 1"
    And I should see "city3"
    And I should see "11345"
    And I should see "country"
    And I should see "street 233"
    And I should see "CAR"
    And I should see "11111"
    And I should see "USA"

  @javascript  
  Scenario: Address without address
    And I follow "Add new address"
    And I fill in "address_address" with ""
    And I fill in "address_zip" with "11111"
    And I fill in "address_city" with "CAR"
    And I fill in "address_state" with "DC"
    And I fill in "address_country" with "USA"
    And I select "home" from "address_address_type_id"
    And I press "Save"
    Then I should see "1 error prohibited this address from being saved"
    And I should see "Address can't be blank"


@javascript 
  Scenario: Edit address
    Then I follow the "edit" link of the addreess "street 1" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    And I fill in "address_address" with "new street"
    And I fill in "address_zip" with "11111"
    And I fill in "address_city" with "CAR"
    And I fill in "address_state" with "DC"
    And I fill in "address_country" with "USA"
    And I select "home" from "address_address_type_id"
    And I press "address_submit"
    Then I should see "new street"
    And I should see "city3"
    And I should see "11345"
    And I should see "country"
    And I should see "CAR"
    And I should see "11111"
    And I should see "USA"
    And I should not see "street 1"

@javascript 
  Scenario: Edit address without an address field
    Then I follow the "edit" link of the addreess "street 1" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    And I fill in "address_address" with ""
    And I fill in "address_zip" with "11111"
    And I fill in "address_city" with "CAR"
    And I fill in "address_state" with "DC"
    And I fill in "address_country" with "USA"
    And I select "home" from "address_address_type_id"
    And I press "address_submit"
    Then I should see "1 error prohibited this address from being saved"
    And I should see "Address can't be blank"

@javascript 
  Scenario: Delete address
    Then I follow the "delete" link of the addreess "street 1" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    Given a confirmation box saying "Are you sure?" should pop up
    When I confirm a js popup on the next step
    Then I should not see "street 1"
    And I should not see "city1"
    And I should not see "state1"



