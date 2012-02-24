def valid_listtask
  @listtask = {:name => "Listtask 1", :project_id => 1}
end
def create_listtask listtask
  visit "/projects/#{listtask[:project_id]}/listtasks/new"
  fill_in "listtask_name", :with => listtask[:name]
  click_button "Create Listtask"
end

Given /^I am on page project with project name "([^"]*)"$/ do |name_project|
  @project = Project.find_by_name(name_project)
  visit "/projects/#{@project.id}"
end

When /^I add Listtask with name "([^"]*)"$/ do |name_listtask|
  click_link "Add listtask"
  page.should have_content "New listtask"
  fill_in "listtask_name", :with => name_listtask
  click_button "Create Listtask"
end

Then /^Redirected to the list of tasks for listtask "([^"]*)"$/ do |name_listtask|
  page.should have_content "Project -> #{@project[:name]} | Listtask -> #{name_listtask}"
end

When /^I add listtask with empty name$/ do
  create_listtask valid_listtask.merge(:name => "")
end

Given /^I have a listtask with name "([^"]*)"$/ do |name|
 create_listtask valid_listtask.merge(:name => name)
end

When /^I change listtask name from "([^"]*)" to "([^"]*)"$/ do |name_old, name_new|
  visit "/projects/1"
  click_link name_old
  click_link "Edit"
  fill_in "listtask_name",:with => name_new
  click_button "Update Listtask"
end

Then /^Listtask "([^"]*)" should be exist$/ do |name|
  Listtask.find_by_name(name).should_not be_nil
end

Then /^Listtask "([^"]*)" should not be exist$/ do |name|
  Listtask.find_by_name(name).should be_nil
end

When /^I delete listtask with name "([^"]*)"$/ do |name|
  visit "/projects/1"
  click_link name
  page.evaluate_script('window.confirm = function() {return true}')
  click_link "Delete"
end

