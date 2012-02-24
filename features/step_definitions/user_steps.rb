def valid_user
  @users = { :email => "test@test.ru",:password => "123456", :password_confirmation => "123456"}
end

Given /^I am exist as a user$/ do
  User.create! valid_user
end

Given /^I am not logged in$/ do
  visit "/sessions/destroy"
end

Given /^I am not existing user with email "([^"]*)"$/ do |email|
  User.find(:first, :conditions => { :email => email}).should be_nil
end

Given /^I am logged in$/ do
  step %{I am exist as a user}
  step %{I sign in with email "test@test.ru" and password "123456"}
end

When /^I sign in with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  visit "/sessions/new"
  fill_in "email", :with => email
  fill_in "password", :with => password
  click_button "Log in"
end

When /^I press on link "([^"]*)"$/ do |link|
  click_link link
end

When /^I fill email "([^"]*)", password "([^"]*)" and password confirmation "([^"]*)"$/ do |email, password, confirmation|
  visit "/users/new"
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => confirmation
  click_button "Create User"
end

When /^I fill password "([^"]*)" and password confirmation "([^"]*)" without email$/ do |password, confirmation|
  visit "/users/new"
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => confirmation
  click_button "Create User"
end

When /^I fill email "([^"]*)" and blank password$/ do |email|
  visit "/users/new"
  fill_in "user_email", :with => email
  fill_in "user_password", :with => ""
  click_button "Create User"
end

When /^I fill email "([^"]*)", password "([^"]*)" and confirmation "([^"]*)"$/ do |email, password, confirmation|
  visit "/users/new"
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  fill_in "user_password", :with => confirmation
  click_button "Create User"
end

Then /^I should not be signed in$/ do
  page.should have_content "Invalid email or password"
end

Then /^I log out$/ do
  visit "/sessions/destroy"
end

Then /^I should see a message "([^"]*)"$/ do |message|
  page.should have_content message
end


Then /^I see page with list of my projects$/ do
  page.should have_content "Listing projects"
end