Capybara.add_selector :message do
  xpath { |message| ".//ul[@id='messages']/li[contains(./h3, '#{message}')]" }
  failure_message do |node, selector|
    others = node.all('#messages > li > h3').map { |node| %("#{node.text}") }
    %(No such message "#{selector.locator}"\n\nOther messages: #{others.to_sentence})
  end
end

module MessageStepsHelper
  def have_message(message)
    have_selector(:message, message)
  end
end
World(MessageStepsHelper)

When /^I send the message "([^"]*)"$/ do |message|
  click_on 'New message'
  fill_in 'New message', :with => message
  click_on 'Send'
end

Then /^I should see the message "([^"]*)"$/ do |message|
  page.should have_message(message)
end

Given /^the user "([^"]*)" has posted the message "([^"]*)"$/ do |username, message|
  user = User.find_by_username(username)
  user ||= User.create!(
    :username => username,
    :email => "#{username}@elabs.se",
    :password => "capybara"
  )
  Message.create!(:user => user, :message => message)
end

When /^I reply to the message "([^"]*)" with "([^"]*)"$/ do |message, reply|
  within :message, message do
    click_on "Reply"
    fill_in "New message", :with => reply
    click_on "Send"
  end
end

When /^(.*) for the message "([^"]*)"$/ do |step, message|
  within :message, message do
    And step
  end
end

Then /^I should see that the message "([^"]*)" is highlighted$/ do |message|
  find("#messages li", :text => message)[:class].should include('highlighted')
end

