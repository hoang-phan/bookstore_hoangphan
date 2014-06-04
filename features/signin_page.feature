Feature:  Sign in page
      A visitor
      Could login to act as a user

      Scenario: Blank login
        Given I am on the signin page
        When I click button "Login"
        Then I should see div "alert.alert-error"

      Scenario: Valid login and sign out
        Given I am on the signin page
        And I have a user
        When I sign in
        Then I should see my email
        And I should see link "Logout"
        When I click link "Logout"
        Then I should see link "Login"
