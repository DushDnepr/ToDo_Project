def valid_project
  @project = {:name => "Project 1", :user_id => @user}
end

def create_project project
  visit "/projects/new"
  fill_in "project_name", :with => project[:name]
  click_button "Create Project"
end

Given /^I have a project with name "([^"]*)"$/ do |name|
  create_project valid_project.merge(:name => name)
end

When /^I add project with valid name$/ do
  create_project valid_project
end

When /^I add project with empty name$/ do
  create_project valid_project.merge(:name => "")
end

When /^I change project name from "([^"]*)" to "([^"]*)"$/ do |name_old, name_new|
  visit "/projects"
  click_link name_old
  click_link "Edit project"
  fill_in "project_name",:with => name_new
  click_button "Update Project"
end

When /^I delete project with name "([^"]*)"$/ do |name|
  visit "/projects"
  page.evaluate_script('window.confirm = function() {return true}')
  click_link "Destroy"
end

Then /^Redirected to the list of tasks for newly created projects$/ do
  page.should have_content "Project -> #{@project[:name]}"
end

Then /^Project "([^"]*)" should be exist$/ do |name|
  Project.find_by_name(name).should_not be_nil
end

Then /^Project "([^"]*)" should not be exist$/ do |name|
  Project.find_by_name(name).should be_nil
end