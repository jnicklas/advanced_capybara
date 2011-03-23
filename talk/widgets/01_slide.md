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

    @@@ruby
    Then /^I should see the message "([^"]*)"$/ do |message|
      page.should have_selector('#messages li', :text => message)
    end

!SLIDE
