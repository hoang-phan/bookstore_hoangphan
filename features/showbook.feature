Feature:  In Book page
  As A user
  I Could see the book content and comment

  @javascript
  Scenario: Show book
    Given I am on the new_user_session page
    And I have a book
    And I have a user
    When I sign in
    And I am on the books page
    When I click image link ".book-title a"
    Then I should see content "Save 20%"
    When I visit the book page
    When I fill in "comment_content" with "Some content"
    And I click button "Send"
    Then I should see content "Save 20%"
    When I fill in "comment_content" with "Some content"
    And I click button "Send"
    Then I should see content "Save 20%"