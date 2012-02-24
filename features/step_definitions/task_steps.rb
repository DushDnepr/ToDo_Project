def valid_task
  @task = {:name => "Task 1",
           :description => "Description for Task 1",
           :state => true,
           :priority => 5,
           :listtask_id => 1}
end

def create_task task
  visit "/projects/#{Listtask.find_by_id(task[:listtask_id]).project_id}/listtasks/#{task[:listtask_id]}/tasks/new"
  fill_in "task_name", :with => task[:name]
  fill_in "task_description", :with => task[:description]
  fill_in "task_priority", :with => task[:priority]
  click_button "Create Task"
end
When /^I add task with name "([^"]*)", description "([^"]*)", state "([^"]*)" and priority "([^"]*)"$/ do |name, descr, state, priority|
  create_task valid_task
end