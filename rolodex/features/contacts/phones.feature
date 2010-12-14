Feature: Contacts Page  Phone Section
  Site should have a Contacts page
  So that users can manage their contacts and  add phones

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
    Given the contact with name "sergio1" created by "sergio.aguirre@live.com.mx" has the following phones:
      | area_code | number  |
      | 312       | 1234567 |
      | 332       | 7654321 |
      | 330       | 1234567 |
    Given I am on the contacts page
    When I follow "sergio1 Tobias aguirre1"
    Then I follow "Edit"


  @javascript 
  Scenario: Create new phone
    And I follow "Add new phone"
    And I fill in "phone_number_area_code" with "233"
    And I fill in "phone_number_number" with "1111167"
    And I select "home" from "phone_number_phone_type_id"
    And I press "Save"
    Then I should see "=> home (233)-111-1167"

  @javascript 
  Scenario: Phone without number
    And I follow "Add new phone"
    And I fill in "phone_number_area_code" with ""
    And I fill in "phone_number_number" with "1111167"
    And I select "home" from "phone_number_phone_type_id"
    And I press "Save"
    Then I should see "prohibited this phone number from being saved"
    And I should see "Area code can't be blank"


@javascript  
  Scenario: Edit Phone
    Then I follow the "edit" link of the phone "1234567" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    And I fill in "phone_number_area_code" with "213"
    And I fill in "phone_number_number" with "1111188"
    And I select "home" from "phone_number_phone_type_id"
    And I press "phone_number_submit"
    Then I should see "=> home (213)-111-1188"

@javascript 
  Scenario: Edit Phone without a number
    Then I follow the "edit" link of the phone "1234567" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    And I fill in "phone_number_area_code" with "213"
    And I fill in "phone_number_number" with ""
    And I select "home" from "phone_number_phone_type_id"
    And I press "phone_number_submit"
    Then I should see "prohibited this phone number from being saved"
    And I should see "Number can't be blank"


@javascript 
  Scenario: Delete  phone
    Then I follow the "delete" link of the phone "1234567" for contact "sergio1" and created by "sergio.aguirre@live.com.mx"
    Given a confirmation box saying "Are you sure?" should pop up
    When I confirm a js popup on the next step
    Then I should not see "(312)-123-4567"