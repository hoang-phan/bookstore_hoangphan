Feature:  In Books page
  As A user
  I Could see the books

  @javascript
  Scenario: View books as a guest
    Given I have a book
    And I am on the books page
    Then I should see title "All books"
    When I select "16" from "per-page"
    And I wait for 1 seconds
    Then I should see title "All books"
    When I click image link "#cart"
    Then I should see link "You must login first"
    And I should not see content "Empty cart"

  @javascript
  Scenario: View books as a user
    Given I am on the new_user_session page
    And I have a user
    And I have a book
    When I sign in
    And I am on the books page
    And I click image link "#cart"
    Then I should not see link "You must login first"
    When I click image link ".add-to-cart"
    Then I should see content "1"
    When I click image link ".add-to-cart"
    Then I should see content "2"
    When I click button "Checkout"
    And I click link "Modify order"
    Then I should see content "Shopping cart"
    When I click image link ".quantity a"
    Then I should see content "Shopping cart"
    When I click link "Checkout"
    And I fill in "Order date" with "Invalid"
    And I click button "Confirm order"
    Then I should see content "Checkout"
    When I fill in "Order date" with "22/01/1992"
    And I click button "Confirm order"
    Then I should see title "All books"
    When I am on the orders page
    Then I should see title "Your past orders"
    When I click image link ".jumbotron a"
    Then I should see title "Order information"
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
    Given I am on the new_user_session page
    And I have a book
    And I have a user
    When I sign in
    And I am on the books page
    When I click image link ".book-title a"
    Then I should see content "Save 20%"
    When I fill in "comment_content" with "Some content"
    And I click button "Send"
    Then I should see content "Save 20%"
    When I fill in "comment_content" with "Some content"
    And I click button "Send"
    Then I should see content "Save 20%"