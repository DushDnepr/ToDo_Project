module ListtasksHelper
  def count_task_in_listtask (list)
    list.tasks.count
  end
end
