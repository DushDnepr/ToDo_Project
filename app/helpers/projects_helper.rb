module ProjectsHelper
  def count_listtask_in_project (project)
    project.listtasks.count
  end

end
