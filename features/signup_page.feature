Feature:  Sign up page
      A visitor
      Could register to be a user

      Scenario: Blank registration
        Given I am on the signup page
        When I click button "Sign up"
        Then I should see content "error"

      Scenario: Blank email registration
        Given I am on the signup page
        When I fill in "Full name" with "skajdhkajsdhkawd"
        And I fill in "Birthday" with "22/01/1992"
        And I fill in "Email" with ""
        And I fill in "Phone" with "0123021312"
        And I fill in "Password" with "123456"
        And I fill in "Confirmation" with "123456"
        And I click button "Sign up"
        Then I should see content "error"

      Scenario: Successful registration
        Given I am on the signup page
        When I fill in "Full name" with "skajdhkajsdhkawd"
        And I fill in "Birthday" with "22/01/1992"
        And I fill in "Email" with "hoangpahn@ea.com"
        And I fill in "Phone" with "0123021312"
        And I fill in "Password" with "123456"
        And I fill in "Confirmation" with "123456"
        And I click button "Sign up"
        Then I should not see content "error"
        And I should receive a confirmation email to "hoangpahn@ea.com"