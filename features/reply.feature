Feature: Replying to a message
  In order to connect closer to people by conversing with them
  As a user
  I want to reply to someones message

  @javascript
  Scenario: reply to a post
    Given the user "jonas" has posted the message "Hello CukeUp"
    And I am signed in as "peter"
    When I reply to the message "Hello CukeUp" with "Hello Jonas"
    Then I should see the message "Hello Jonas"

  @javascript
  Scenario: click the "in reply to" link to see the original message highlighted
    Given the user "jonas" has posted the message "Hello CukeUp"
    And I am signed in as "peter"
    When I reply to the message "Hello CukeUp" with "Hello Jonas"
    And I click "In reply to" for the message "Hello Jonas"
    Then I should see that the message "Hello CukeUp" is highlighted
