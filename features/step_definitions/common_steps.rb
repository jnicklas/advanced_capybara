Given /^I am signed in as "([^"]*)"$/ do |email|
  User.create!(:email => email, :password => 'capybara')
  visit('/')
  fill_in 'Email', :with => email
  fill_in 'Password', :with => 'capybara'
  click_on 'Sign in'
end

