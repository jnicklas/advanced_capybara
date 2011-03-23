Given /^I am signed in$/ do
  username = Capybara.session_name
  User.create!(:username => username, :email => "#{username}@elabs.se", :password => 'capybara')
  visit('/')
  fill_in 'Username', :with => username
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

