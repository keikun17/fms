Feature: Manage administrators
  In order to manage the FMS
  We should be able to login as an administrator
  
  
  Scenario: Register new administrator
    Given I am on the the administrator registration page
    When I fill in "Email" with "email1@yahoo.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I press "Sign up"
    Then I should see "You have signed up successfully."
  
  Scenario: Login as an administrator
    Given the following administrators:
      | email          | password |
      | email@test.com | qwerty   |
    And I am on the administrator sign in page
    When I fill in "Email" with "email@test.com"
    And I fill in "Password" with "qwerty"
    When I press "Sign in"
    Then I should see "Signed in successfully."
