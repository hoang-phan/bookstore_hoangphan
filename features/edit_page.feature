Feature:  In Edit page
  As A user
  I Could edit my own profile

  Scenario: Invalid edit then valid edit
    Given I am on the new_user_session page
    And I have a user
    When I sign in
    And I click link "settings"
    And I click button "Update"
    Then I should see content "error"
    When I fill in "Current password" with "12345678"
    And I click button "Update"
    Then I should not see content "error"