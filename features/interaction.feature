Feature:

  Scenario: Add a post
    Given I am signed in as "jonas"
    When I send the message "This is an awesome message"
    Then I should see the message "This is an awesome message"

  @javascript
  Scenario: Add a post with JS
    Given I am signed in as "jonas"
    When I send the message "This is an awesome message"
    Then I should see the message "This is an awesome message"

  @javascript
  Scenario: See live updates of posts
    Given I am signed in as "jonas"
    And I am signed in as "jimmy"
    When I send the message "This is an awesome message" as "jonas"
    Then I should see the message "This is an awesome message" as "jonas"
    And I should see the message "This is an awesome message" as "jimmy"
