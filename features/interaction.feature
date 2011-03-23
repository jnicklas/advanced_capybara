Feature:

  Scenario: Add a post
    Given I am signed in as "jonas"
    When I send the message "Hello CukeUp"
    Then I should see the message "Hello CukeUp"

  @javascript
  Scenario: Add a post with JS
    Given I am signed in as "jonas"
    When I send the message "Hello CukeUp"
    Then I should see the message "Hello CukeUp"

  @javascript
  Scenario: See live updates of posts
    Given I am signed in as "jonas"
    And I am signed in as "peter"
    When I send the message "Hello CukeUp" as "jonas"
    Then I should see the message "Hello CukeUp" as "jonas"
    And I should see the message "Hello CukeUp" as "peter"
