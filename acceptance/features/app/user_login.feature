@wip
Feature: As an admin
 I want to login to admin page
 So that I can start my recruiting job

    Scenario: login
       Given I am on the login page
       When I submit my username and password
       Then I should be on admin page