class TasksController < ApplicationController
  before_filter :load_list

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def edit
  end

  def create
    @task = @list.tasks.new(params[:task])

    if @task.save
      redirect_to project_listtask_path(@project, @list), notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to project_listtask_path(@project, @list), notice: 'Task was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @list = @task.listtask
    @task.destroy

    redirect_to project_listtask_path(@project, @list)
  end

  private

  def load_list
    @task = Task.find(params[:id]) if params[:id]
    @list = Listtask.find(params[:listtask_id]) if params[:listtask_id]
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
