Feature:  As an student
  I want to submit my information
  So that I can let hr know me

  Scenario: Students submit their information
    Given I am on the submit page
    When I fill "Name" as "Xiao Zhang"
    And I fill "University" as "XJTU"
    And I fill "Phone" as "123456789"
    And I fill "Email" as "bonnshore@gmail.com"
    And I fill "Major" as "Software Engineering"
    And I click "Save Changes" button
    Then I should see the following in database:
      | name       | Xiao Zhang           |
      | university | XJTU                 |
      | phone      | 123456789            |
      | email      | bonnshore@gmail.com  |
      | major      | Software Engineering |

  Scenario: Students submit their information with invalid data
    Given I am on the submit page
    When I click "Save Changes" button
    Then I should see the error messages "Name can not be empty"

  @wip
  Scenario: Students submit their information with invalid data
    Given I am on the submit page
    When I click "Save Changes" button
    Then I should see the error messages "Name can not be empty"
    And I should see the error messages "University can not be empty"
    And I should see the error messages "Phone can not be empty"
    And I should see the error messages "Email can not be empty"
    And I should see the error messages "Major can not be empty"
