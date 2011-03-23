!SLIDE

# Testing user interaction

!SLIDE

## Why?

!SLIDE bullets

* Data contention
* Live updates
* Different user roles

!SLIDE

## Example: Live updates

!SLIDE

## Websockets
### (but not really)

!SLIDE code

    @@@cucumber
    Given I am signed in as "jonas"
    And I am signed in as "peter"
    When I send the message "Hello CukeUp" as "jonas"
    Then I should see the message "Hello CukeUp" as "jonas"
    And I should see the message "Hello CukeUp" as "peter"

!SLIDE code

    @@@ruby
    Then /^(.*) as "([^"]*)"$/ do |step, username|
      Capybara.session_name = username
      And step
    end

!SLIDE code

    @@@ruby
    When /^I send the message "([^"]*)"$/ do |message|
      fill_in 'New message', :with => message
      click_on 'Send'
    end

!SLIDE code

    @@@ruby
    Given /^I am signed in$/ do
      User.create!(
        :username => Capybara.session_name,
        :email => "#{Capybara.session_name}@elabs.se",
        :password => "capybara"
      )
      visit("/")
      fill_in "Username", :with => Capybara.session_name
      fill_in "Password", :with => "capybara"
      click_on "Sign in"
    end

!SLIDE

## DEMO!
