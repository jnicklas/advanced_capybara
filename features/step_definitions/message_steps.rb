When /^I send the message "([^"]*)"$/ do |message|
  fill_in 'New message', :with => message
  click_on 'Send'
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_selector('#messages li', :text => message)
end

