Feature:  In Admin page
  As A visitor
  I Should login to be an admin

  Scenario: Login
    Given I am an admin
    And I am on the new_admin_user_session page
    Then I should see content "Bookstore Hoangphan"
    And I login
    Then I should see content "Welcome"