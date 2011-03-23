Feature: Posting message
  In order to spread my view of the world
  As a user
  I want to post messages to the world

  Scenario: Add a post
    Given I am signed in as "jonas"
    When I send the message "Hello CukeUp"
    Then I should see the message "Hello CukeUp"

  @javascript
  Scenario: Add a post with JS
    Given I am signed in as "jonas"
    When I send the message "Hello CukeUp"
    Then I should see the message "Hello CukeUp"
