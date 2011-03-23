!SLIDE splash

# Advanced acceptance testing
# with Capybara

### Jonas Nicklas – @jonicklas

!SLIDE center

![Caplin Rous](caplin.jpg)

!SLIDE

# Caplin Rous
## @caplinrous

!SLIDE

# Caplin Rous
## @caplinrous
### 2007-10-07  –  2011-04-01
### R.I.P.

!SLIDE

# Why Capybara?

!SLIDE

# Consistent abstraction

!SLIDE

## Multitude of backends

!SLIDE bullets

* Selenium Webdriver
* HTMLUnit
* Envjs
* Zombie.js
* Pure ruby

!SLIDE

## Write code once switch driver at will

!SLIDE

# High level abstraction

!SLIDE

## Goal: describe the user interaction

!SLIDE

## Cucumber

!SLIDE

## Kind of the default
### when using Cucumber with Ruby

!SLIDE

## Made for each other

!SLIDE code

    @@@cucumber
    Given I am on the homepage
    When I sign in as "jonas" with the password "capybara"
    Then I should be signed in as "jonas"

!SLIDE code

    @@@ruby
    Given /^I am on the homepage$/
      visit('/')
    end

    When /^I sign in as "([^"]*)" with the password "([^"]*)"$/ do |username, password|
      fill_in "Username", :with => email
      fill_in "Password", :with => password
      click_on "Sign in"
    end

    Then /^I should be signed in as "([^"]*)"$/ do |username|
      page.should have_content("Signed in as #{username}")
    end
