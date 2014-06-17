Feature:  In Home page
  As A visitor
  I Should see the links

  Scenario: Visit home page
    Given I am on the home page

    Then I should see title "Welcome"
    And I should see link "Sign up now"
    And I should see link "login"