Given /^I am signed in$/ do
  email = "#{Capybara.session_name}@elabs.se"
  User.create!(:email => email, :password => 'capybara')
  visit('/')
  fill_in 'Email', :with => email
  fill_in 'Password', :with => 'capybara'
  click_on 'Sign in'
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

