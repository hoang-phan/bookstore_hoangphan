Feature:  In Admin page
  As A visitor
  I Should login to be an admin

  Background:
    Given I am an admin
    And I have a book
    And I have a category
    And I am on the new_admin_user_session page
    When I login

  @javascript
  Scenario: Admin page tour
    Then I should see content "Welcome"
    When I click link "Admin Users"
    Then I should see link "New Admin User"
    When I click link "Edit"
    Then I should see content "Edit Admin User"
    When I click link "Books"
    And I click link "Edit"
    Then I should see content "Edit Book"
    When I click link "Categories"
    And I click link "My Categories"
    And I click link "Edit"
    Then I should see content "Edit My Category"

  @javascript
  Scenario: Delete a book
    When I click link "Books"
    And I click link "Delete"
    And I confirm
    Then I should see content "Book was successfully destroyed"