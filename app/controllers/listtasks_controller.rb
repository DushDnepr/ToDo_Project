class ListtasksController < ApplicationController
  before_filter :load_project_list

  def show
    #@listtask = Listtask.find(params[:id])
    if params[:status]
      @tasks = @listtask.tasks.where('state = ?', params[:status]). order('priority')
    else
      @tasks = @listtask.tasks.order('priority')
    end
  end

  def new
    @listtask = Listtask.new
  end

  def edit
    @listtask = Listtask.find(params[:id])
  end

  def create
    @listtask = @project.listtasks.create(params[:listtask])

    if @listtask.save
      redirect_to project_listtask_path(@project, @listtask), notice: 'Listtask was successfully created.'
    else
      flash[:error] = "Name of listtask can't be blank'"
    end
  end

  def update
    if @listtask.update_attributes(params[:listtask])
      redirect_to project_listtask_path(@project, @listtask), notice: 'Listtask was successfully updated.'
    else
      flash[:error] = "Name of listtask can't be blank"
      render action: "edit"
    end
  end

  def destroy
    @listtask.destroy
    redirect_to project_path(@project), notice: "Listtask was successfully deleted"
  end

  private

  def load_project_list
    @listtask = Listtask.find(params[:id]) if params[:id]
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
