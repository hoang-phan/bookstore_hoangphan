Feature:  Books page
      A user
      Could see the book content

      Scenario: View book
      Given I have a book
      And I visit the book page
      And I should see content "Description"