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
    Then I should see success message

