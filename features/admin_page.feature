Feature:  In Admin page
  As A visitor
  I Should login to be an admin

  @javascript
  Scenario: Admin page tour
    Given I am an admin
    And I have a book
    And I have a category
    And I am on the new_admin_user_session page
    Then I should see content "Bookstore Hoangphan"
    When I login
    Then I should see content "Welcome"
    When I click link "Admin Users"
    Then I should see link "New Admin User"
    When I click link "Edit"
    Then I should see content "Edit Admin User"
    When I click link "Books"
    And I click link "Edit"
    Then I should see content "Edit Book"
    When I click link "Categories"
    When I click link "My Categories"
    And I click link "Edit"
    Then I should see content "Edit My Category"

  @javascript
  Scenario: Delete a book
    Given I am an admin
    And I have a book
    And I am on the new_admin_user_session page
    When I login
    And I click link "Books"
    And I click link "Delete"
    And I confirm
    Then I should see content "Book was successfully destroyed"