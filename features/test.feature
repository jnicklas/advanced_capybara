Feature: test
  Scenario: foobar
    Given I am on the homepage
    And I sign in as "jonas" with the password "capybara"
    Then I should be signed in as "jonas"

