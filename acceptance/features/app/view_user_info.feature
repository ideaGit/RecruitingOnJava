Feature:  As an admin
  I want to view all the basic information in a list,
  so that I can be clear about the candidates.

  Scenario: admin view candidates information
    Given a candidate submit his information as following:
      | name       | Xiao Zhang           |
      | university | XJTU                 |
      | phone      | 123456789            |
      | email      | bonnshore@gmail.com  |
      | major      | Software Engineering |
    When I am on the candidates information page
    Then I can see the following candidates information:
      | name       | Xiao Zhang           |
      | university | XJTU                 |
      | phone      | 123456789            |
      | email      | bonnshore@gmail.com  |
      | major      | Software Engineering |