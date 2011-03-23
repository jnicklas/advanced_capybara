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

When /^I send the message "([^"]*)"$/ do |message|
  fill_in 'New message', :with => message
  click_on 'Send'
end

Then /^(.*) as "([^"]*)"$/ do |step, username|
  Capybara.session_name = username
  And step
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_selector('#messages li', :text => message)
end

