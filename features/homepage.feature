Feature:  Home page
  A visitor
  Should see the links

  Scenario: Visit home page
    Given I am on the home page

    Then I should see title "Welcome"
    And I should see link "Sign up now"
    And I should see link "Login"

    When I click link "Categories"
    Then I should see title "All categories"