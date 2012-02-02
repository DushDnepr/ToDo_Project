class TasksController < ApplicationController
  before_filter :load_list

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    # @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @task }
    end
  end

  # GET /tasks/ffnew
  # GET /tasks/ffnew.json
  def new
    @task = @list.tasks.new

    respond_to do |format|
      format.html # _login_form.html.haml
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @list.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_listtask_path(@project, @list), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to project_listtask_path(@project, @list), notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @list = @task.listtask
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_listtask_path(@project, @list) }
      format.json { head :ok }
    end
  end

  private

  def load_list
    @task = Task.find(params[:id]) if params[:id]
    @list = Listtask.find(params[:listtask_id]) if params[:listtask_id]
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
