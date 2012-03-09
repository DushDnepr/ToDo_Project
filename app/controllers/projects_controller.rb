class ProjectsController < ApplicationController

  def index
    @projects = Project.where('owner_id = ?', current_user.id).order('name')

  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.owner_id = current_user.id

    if @project.save
      Invite.create!(:user_id => @project.owner_id, :project_id => @project.id, :role => :owner)
      redirect_to @project, notice: 'Project was successfully created.'
    else
      flash[:error] = "Name of project can't be blank"
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      flash[:error] = "Name of project can't be blank"
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url, notice: 'Project was successfully deleted'
  end

end
