Feature:  In Books page
  As A user
  I Could see the books

  Scenario: View books
  Given I am on the books page
  Then I should see title "All books"

  Scenario: Show book
  Given I have a book
  And I visit the book page
  And I should see content "Save 20%"

  Scenario: Show category
  Given I have a book
  And I have a category
  And the book belongs to the category
  When I visit the category page
  Then I should see content of the book

  Scenario: Show all categories
  Given I am on the categories page
  Then I should see title "All categories"