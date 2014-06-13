Feature:  In Books page
  As A user
  I Could see the books

  @javascript
  Scenario: View books
    Given I have a book
    And I am on the books page
    Then I should see title "All books"
    When I select "16" from "per-page"
    Then I should see title "All books"
    When I click image link ".add-to-cart"
    Then I should see content "1"
    When I click image link ".add-to-cart"
    Then I should see content "2"
    When I click image link "#cart"
    And I click button "Empty cart"
    And I confirm
    Then I should see content "0"

  Scenario: Show category
    Given I have a book
    And I have a category
    And the book belongs to the category
    When I visit the category page
    Then I should see content of the book

  Scenario: Show all categories
    Given I am on the categories page
    Then I should see title "All categories"

  @javascript
  Scenario: Show book
    Given I have a book
    And I am on the books page
    When I click image link ".book-title a"
    Then I should see content "Save 20%"
    When I click image link ".rating-star"
    Then I should see content "Save 20%"