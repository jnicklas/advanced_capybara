When /^I send the message "([^"]*)"$/ do |message|
  fill_in 'New message', :with => message
  click_on 'Send'
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_selector('#messages li', :text => message)
end

Given /^the user "([^"]*)" has posted the message "([^"]*)"$/ do |username, message|
  user = User.find_by_username!(username)
  Message.create!(:user => user, :message => message)
end

When /^I reply to the message "([^"]*)" with "([^"]*)"$/ do |message, reply|
  within "#messages li", :text => message do
    click_on "Reply"
    fill_in "New Reply", :with => reply
    click_on "Send"
  end
end

When /^(.*) for the message "([^"]*)"$/ do |step, message|
  within "#messages li", :text => message do
    And step
  end
end

Then /^I should see that the message "([^"]*)" is highlighted$/ do |arg1|
  find("#messages li", :text => message)[:class].should include('highlighed')
end

