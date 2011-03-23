Feature: Interaction
  In order to connect with other people
  As a user
  I want to immediately see their posts

  @javascript
  Scenario: See live updates of posts
    Given I am signed in as "jonas"
    And I am signed in as "peter"
    When I send the message "Hello CukeUp" as "jonas"
    Then I should see the message "Hello CukeUp" as "jonas"
    And I should see the message "Hello CukeUp" as "peter"
