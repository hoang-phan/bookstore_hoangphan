Feature:  Sign in page
      A visitor
      Could login to act as a user

      Scenario: Blank login
        Given I am on the signin page
        When I click button "Login"
        Then I should see div "alert.alert-error"
