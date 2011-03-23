!SLIDE

## Locating and interacting with
# Widgets

!SLIDE

## Why?

!SLIDE bullets

* Domain language
* DRY
* Prettier

!SLIDE

    @@@cucumber
    Scenario: reply to a post
      Given the user "jonas" has posted the message "Hello CukeUp"
      And I am signed in as "peter"
      When I reply to the message "Hello CukeUp" with "Hello Jonas"
      Then I should see the message "Hello Jonas"

!SLIDE

    @@@ruby
    Then /^I should see the message "([^"]*)"$/ do |message|
      page.should have_selector(
        :xpath,
        ".//ul[@id='messages']/li[contains(./h3, '#{message}')]"
      )
    end

!SLIDE

## What are we looking for?

!SLIDE

## Message

!SLIDE code

    @@@ruby
    Capybara.add_selector :message do
      xpath { |message| ".//ul[@id='messages']/li[contains(./h3, '#{message}')]" }
    end

    Then /^I should see the message "([^"]*)"$/ do |message|
      page.should have_selector(:message, message)
    end

!SLIDE code

    @@@ruby
    module MessageStepsHelper
      def have_message(message)
        have_selector(:message, message)
      end
    end
    World(MessageStepsHelper)

    Then /^I should see the message "([^"]*)"$/ do |message|
      page.should have_message(message)
    end

!SLIDE

## Error messages

!SLIDE

## Expected false to be true
### Capybara 0.4.1.2 (stable)

!SLIDE

## expected message "Hello CukeUp" to return something
### Capybara master

!SLIDE

## We can do better!

!SLIDE code

    @@@ruby
    Capybara.add_selector :message do
      xpath { |message| ".//ul[@id='messages']/li[contains(./h3, '#{message}')]" }
      failure_message do |node, selector|
        others = node.all('#messages > li > h3').map { |node| %("#{node.text}") }
        %(No such message "#{selector.locator}"\n\nOther messages: #{others.to_sentence})
      end
    end

!SLIDE

## No such message "Hello CukeUp"
## Other messages: "Hello Friends" and "Hello World"
### With custom errors

!SLIDE code

    @@@ruby
    When /^I reply to the message "([^"]*)" with "([^"]*)"$/ do |message, reply|
      within :message, message do
        click_on "Reply"
        fill_in "New message", :with => reply
        click_on "Send"
      end
    end

!SLIDE

## DEMO!
