Feature:  In Sign up page
  As A visitor
  I Could register to be a user


  Background:
    Given I am on the new_user_registration page

  Scenario: Blank registration
    When I click button "Register"
    Then I should see content "error"

  Scenario: Blank email registration
    When I fill in these fields as:
    |   Full name               |   skajdhkajsdhkawd    |
    |   Birthday                |   22/01/1992          |
    |   Email                   |                       |
    |   Password                |   12345678            |
    |   Password confirmation   |   12345678            |
    |   Phone                   |   0123021312          |
    And I click button "Register"
    Then I should see content "error"

  Scenario: valid registration but captcha error
    When I fill in these fields as:
    |   Full name               |   skajdhkajsdhkawd    |
    |   Birthday                |   22/01/1992          |
    |   Email                   |   hoangpahn@ea.com    |
    |   Password                |   12345678            |
    |   Password confirmation   |   12345678            |
    |   Phone                   |   0123021312          |
    And I do not verify captcha signup
    And I click button "Register"
    Then I should see title "Sign up"

  Scenario: valid registration
    When I fill in these fields as:
    |   Full name               |   skajdhkajsdhkawd    |
    |   Birthday                |   22/01/1992          |
    |   Email                   |   hoangpahn@ea.com    |
    |   Password                |   12345678            |
    |   Password confirmation   |   12345678            |
    |   Phone                   |   0123021312          |
    And I verify captcha signup
    And I click button "Register"
    Then I should not see title "Sign up"