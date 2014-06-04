Feature:  Show user page
      An anonymous user
      Should be able to view information

      Scenario: Visit show page
        Given I have a user
        And on page of the first user

        Then I should see content of the first user