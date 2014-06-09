Feature:  Sign in page
      A visitor
      Could login to act as a user

      Scenario: Blank login
        Given I am on the new_user_session page
        When I click button "Sign in"
        Then I should see content "Sign in"

      Scenario: Valid login and sign out
        Given I am on the new_user_session page
        And I have a user
        When I sign in
        Then I should see content "Rock with us members"
        And I should see link "Logout"
        When I click link "Logout"
        Then I should see link "Login"

      Scenario: Consecutive login fails
        Given I am on the new_user_session page
        And I have a user
        When I sign in fail 3 times
        Then I should see content "You have failed more than"
        When I do not verify captcha
        And I sign in
        Then I should see content "Sign in"
        When I verify captcha
        And I sign in
        Then I should see link "Logout"

