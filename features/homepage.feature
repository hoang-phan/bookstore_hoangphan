Feature:  In Home page
  As A visitor
  I Should see the links

  Background:
    Given I have a category
    And I am on the home page

  Scenario: Visit home page
    Then I should see title "Welcome"
    And I should see link "Sign up now"
    And I should see link "login"

  @javascript
  Scenario: Search some book
    When I fill in "search" with "somename"
    And I click image link "#search-button"
    Then I should see content "Search results"

  @javascript
  Scenario: Search some book of a category
    When I fill in "search" with "somename"
    And I click image link "#category-search"
    And I click image link "#search-menu li"
    And I click image link "#search-button"
    Then I should see content "Search results"
