Given /^I am on the homepage$/ do
  visit("/")
end

Given /^I click on "([^"]*)"$/ do |link|
  click_on(link)
end

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

Then /^(.*) as "([^"]*)"$/ do |step, username|
  Capybara.session_name = username
  And step
end
