Feature:

  Scenario: Add a post
    Given I am signed in as "jonas@elabs.se"
    And I am on the homepage
    When I fill in "New message" with "This is an awesome message"
    And I press "Send"
    Then I should see "This is an awesome message by jonas@elabs.se"

  @javascript
  Scenario: Add a post with JS
    Given I am signed in as "jonas@elabs.se"
    And I am on the homepage
    When I fill in "New message" with "This is an awesome message"
    And I press "Send"
    Then I should see "This is an awesome message by jonas@elabs.se"
